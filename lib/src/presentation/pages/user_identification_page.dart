import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserIdentificationPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  UserIdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Identification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter your ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveUserId(context),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveUserId(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', _controller.text);
    if (context.mounted) Navigator.of(context).pushReplacementNamed('/vinInput');
  }
}

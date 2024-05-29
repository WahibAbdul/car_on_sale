import 'package:car_on_sale/src/presentation/bloc/auction_bloc.dart';
import 'package:car_on_sale/src/presentation/bloc/auction_event.dart';
import 'package:car_on_sale/src/presentation/bloc/auction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VinInputPage extends StatefulWidget {
  const VinInputPage({super.key});

  @override
  VinInputPageState createState() => VinInputPageState();
}

class VinInputPageState extends State<VinInputPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VIN Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter VIN'),
            ),
            const SizedBox(height: 20),
            BlocConsumer<AuctionBloc, AuctionState>(
              listener: (context, state) {
                if (state is AuctionLoaded) {
                  Navigator.of(context).pushNamed('/auctionData', arguments: state.auctionData);
                } else if (state is AuctionError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuctionLoading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () => _fetchData(context),
                  child: const Text('Fetch Data'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      context.read<AuctionBloc>().add(AuctionDataFetchedEvent(
            _controller.text,
            userId,
          ));
    }
  }
}

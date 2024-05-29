import 'package:car_on_sale/src/domain/entities/auction_data.dart';
import 'package:flutter/material.dart';

class AuctionDataPage extends StatelessWidget {
  final AuctionData auctionData;

  const AuctionDataPage({super.key, required this.auctionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auction Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Model: ${auctionData.model}'),
            Text('Price: ${auctionData.price}'),
            Text('UUID: ${auctionData.uuid}'),
            Text('Feedback: ${auctionData.feedback}'),
            Text('Positive Feedback: ${auctionData.positiveCustomerFeedback}'),
          ],
        ),
      ),
    );
  }
}

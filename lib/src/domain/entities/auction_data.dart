// lib/domain/entities/auction_data.dart

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AuctionData extends Equatable {
  final int id;
  final String make;
  final String model;
  final int price;
  final String uuid;
  final String feedback;
  final bool positiveCustomerFeedback;

  const AuctionData({
    required this.id,
    required this.make,
    required this.model,
    required this.price,
    required this.uuid,
    required this.feedback,
    required this.positiveCustomerFeedback,
  });

  @override
  List<Object> get props => [
        id,
        make,
        model,
        price,
        uuid,
        feedback,
        positiveCustomerFeedback,
      ];
}

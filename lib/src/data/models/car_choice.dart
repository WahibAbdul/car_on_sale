import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CarChoice extends Equatable {
  final String make;
  final String model;
  final String containerName;
  final int similarity;
  final String externalId;

  const CarChoice({
    required this.make,
    required this.model,
    required this.containerName,
    required this.similarity,
    required this.externalId,
  });

  factory CarChoice.fromJson(Map<String, dynamic> json) => CarChoice(
        make: json["make"],
        model: json["model"],
        containerName: json["containerName"],
        similarity: json["similarity"],
        externalId: json["externalId"],
      );

  Map<String, dynamic> toJson() => {
        "make": make,
        "model": model,
        "containerName": containerName,
        "similarity": similarity,
        "externalId": externalId,
      };

  @override
  List<Object?> get props => [
        make,
        model,
        containerName,
        similarity,
        externalId,
      ];
}

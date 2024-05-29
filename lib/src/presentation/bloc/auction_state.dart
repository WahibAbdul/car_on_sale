import 'package:car_on_sale/src/domain/entities/auction_data.dart';
import 'package:equatable/equatable.dart';

abstract class AuctionState extends Equatable {
  const AuctionState();

  @override
  List<Object> get props => [];
}

class AuctionInitial extends AuctionState {}

class AuctionLoading extends AuctionState {}

class AuctionLoaded extends AuctionState {
  final AuctionData auctionData;

  const AuctionLoaded(this.auctionData);

  @override
  List<Object> get props => [auctionData];
}

class AuctionError extends AuctionState {
  final String message;

  const AuctionError(this.message);

  @override
  List<Object> get props => [message];
}

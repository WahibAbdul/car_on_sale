import 'package:equatable/equatable.dart';

abstract class AuctionEvent extends Equatable {
  const AuctionEvent();

  @override
  List<Object> get props => [];
}

class AuctionDataFetchedEvent extends AuctionEvent {
  final String vin;
  final String userId;

  const AuctionDataFetchedEvent(this.vin, this.userId);

  @override
  List<Object> get props => [vin, userId];
}

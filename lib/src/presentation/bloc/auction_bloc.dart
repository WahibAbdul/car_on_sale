import 'package:bloc/bloc.dart';
import 'package:car_on_sale/src/domain/repositories/auction_repository.dart';

import 'auction_event.dart';
import 'auction_state.dart';

class AuctionBloc extends Bloc<AuctionEvent, AuctionState> {
  final AuctionRepository _repository;

  AuctionBloc(this._repository) : super(AuctionInitial()) {
    {
      on<AuctionEvent>(
        (event, emit) async {
          if (event is AuctionDataFetchedEvent) {
            emit(AuctionLoading());
            try {
              final auctionData = await _repository.fetchAuctionData(
                event.vin,
                event.userId,
              );
              return emit(AuctionLoaded(auctionData));
            } catch (e) {
              return emit(AuctionError(e.toString()));
            }
          }
        },
      );
    }
  }
}

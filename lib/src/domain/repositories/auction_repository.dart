import 'package:car_on_sale/src/domain/entities/auction_data.dart';

abstract class AuctionRepository {
  Future<List<AuctionData>> fetchAuctionData(String vin, String userId);
  Future<List<AuctionData>> getCachedAuctionData();
}

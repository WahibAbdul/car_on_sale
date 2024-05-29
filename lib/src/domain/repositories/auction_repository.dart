import 'package:car_on_sale/src/domain/entities/auction_data.dart';

abstract class AuctionRepository {
  Future<AuctionData> fetchAuctionData(String vin, String userId);
  Future<void> saveAuctionData(AuctionData auctionData);
  Future<AuctionData?> getCachedAuctionData();
}

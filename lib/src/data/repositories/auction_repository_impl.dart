import 'package:car_on_sale/src/data/sources/auction_local_data_source.dart';
import 'package:car_on_sale/src/data/sources/auction_remote_data_source.dart';
import 'package:car_on_sale/src/domain/entities/auction_data.dart';
import 'package:car_on_sale/src/domain/repositories/auction_repository.dart';

class AuctionRepositoryImpl implements AuctionRepository {
  final AuctionRemoteDataSource remoteDataSource;
  final AuctionLocalDataSource localDataSource;

  AuctionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<AuctionData>> fetchAuctionData(String vin, String userId) async {
    final auctionData = await remoteDataSource.fetchAuctionData(vin, userId);
    await localDataSource.saveAuctionData(auctionData);
    return auctionData;
  }

  @override
  Future<List<AuctionData>> getCachedAuctionData() async {
    return localDataSource.getCachedAuctionData();
  }
}

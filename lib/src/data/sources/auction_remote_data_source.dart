import 'dart:convert';
import 'dart:developer';
import 'package:car_on_sale/src/data/models/auction_data_model.dart';
import 'package:car_on_sale/src/domain/services/challenge_service.dart';
import 'package:http/http.dart' as http;

class AuctionRemoteDataSource {
  final http.Client client;

  AuctionRemoteDataSource(this.client);

  Future<AuctionDataModel> fetchAuctionData(String vin, String userId) async {
    final response = await client.get(
      Uri.https('anyUrl'),
      headers: {CosChallenge.user: userId},
    );

    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log(response.body);
      return AuctionDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch auction data');
    }
  }
}

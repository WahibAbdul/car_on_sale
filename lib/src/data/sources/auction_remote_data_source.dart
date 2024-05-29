import 'dart:convert';
import 'dart:developer';
import 'package:car_on_sale/src/data/models/auction_data_model.dart';
import 'package:car_on_sale/src/domain/services/challenge_service.dart';
import 'package:http/http.dart' as http;

class AuctionRemoteDataSource {
  final http.Client client;

  AuctionRemoteDataSource(this.client);

  Future<List<AuctionDataModel>> fetchAuctionData(String vin, String userId) async {
    final response = await client.get(
      Uri.https('anyUrl'),
      headers: {CosChallenge.user: userId},
    );

    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      return [AuctionDataModel.fromJson(jsonDecode(response.body))];
    } else if (response.statusCode == 300) {
      final data = jsonDecode(response.body) as List;
      final objs = data.map((e) => AuctionDataModel.fromJson(e as Map<String, dynamic>)).toList();
      return objs;
    } else if (response.statusCode == 400) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'] as String?;
      throw Exception(message);
    } else {
      throw Exception('Failed to fetch auction data');
    }
  }
}

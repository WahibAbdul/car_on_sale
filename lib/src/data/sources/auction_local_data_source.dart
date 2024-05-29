import 'dart:convert';

import 'package:car_on_sale/src/data/models/auction_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuctionLocalDataSource {
  AuctionLocalDataSource();

  Future<void> saveAuctionData(List<AuctionDataModel> list) async {
    final jsonString = jsonEncode(list.map((e) => e.toJson()).toList());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auctionData', jsonString);
  }

  Future<List<AuctionDataModel>> getCachedAuctionData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('auctionData');
    if (jsonString != null) {
      final data = jsonDecode(jsonString) as List<Map<String, Object>>;
      final objs = data.map((e) => AuctionDataModel.fromJson(e)).toList();
      return objs;
    }
    return [];
  }
}

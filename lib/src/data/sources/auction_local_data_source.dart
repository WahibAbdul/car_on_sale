import 'dart:convert';

import 'package:car_on_sale/src/data/models/auction_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuctionLocalDataSource {
  AuctionLocalDataSource();

  Future<void> saveAuctionData(AuctionDataModel auctionData) async {
    final jsonString = jsonEncode(auctionData.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auctionData', jsonString);
  }

  Future<AuctionDataModel?> getCachedAuctionData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('auctionData');
    if (jsonString != null) {
      return AuctionDataModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}

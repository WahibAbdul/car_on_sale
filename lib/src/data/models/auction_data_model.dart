import 'package:car_on_sale/src/domain/entities/auction_data.dart';

class AuctionDataModel extends AuctionData {
  const AuctionDataModel({
    required super.id,
    required super.make,
    required super.model,
    required super.price,
    required super.uuid,
    required super.feedback,
    required super.positiveCustomerFeedback,
  });

  factory AuctionDataModel.fromJson(Map<String, dynamic> json) {
    return AuctionDataModel(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      price: json['price'],
      uuid: json['_fk_uuid_auction'],
      feedback: json['feedback'],
      positiveCustomerFeedback: json['positiveCustomerFeedback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'price': price,
      'uuid': uuid,
      'feedback': feedback,
      'positiveCustomerFeedback': positiveCustomerFeedback,
    };
  }
}

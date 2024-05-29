import 'package:car_on_sale/src/domain/entities/auction_data.dart';

class AuctionDataModel extends AuctionData {
  const AuctionDataModel({
    super.id,
    super.make,
    super.model,
    super.price,
    super.uuid,
    super.feedback,
    super.positiveCustomerFeedback,
    super.containerName,
    super.externalId,
    super.similarity,
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
      containerName: json['containerName'],
      externalId: json['externalId'],
      similarity: json['similarity'],
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
      'similarity': similarity,
      'containerName': containerName,
      'externalId': externalId,
    };
  }
}

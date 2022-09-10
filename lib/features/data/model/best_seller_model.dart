import 'package:architecture/features/domain/entites/best_seller_entity.dart';

class BestSellerModel extends BestSellerEntity{
  BestSellerModel({
    required id,
    required title,
    required priceWithoutDiscount,
    required discountPrice,
    required picture
}) : super (
    id: id,
    title: title,
    priceWithoutDiscount: priceWithoutDiscount,
    discountPrice: discountPrice,
    picture: picture
  );

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
        id: json['id'],
        title: json['title'],
        priceWithoutDiscount: json['price_without_discount'],
        discountPrice: json['discount_price'],
        picture: json['picture']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priceWithoutDiscount': priceWithoutDiscount,
      'discountPrice': discountPrice,
      'picture': picture
    };
  }
}
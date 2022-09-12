import 'package:architecture/features/domain/entites/cart_entity.dart';

class BasketModel extends Basket {
  BasketModel({id, images, price, title}) : super(id: id, images: images, price: price, title: title);

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      id: json['id'],
      images: json['images'],
      price: json['price'],
      title: json['title']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
      'price': price,
      'title': title
    };
  }
}
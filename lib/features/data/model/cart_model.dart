import 'package:architecture/features/data/model/cart_location_model.dart';
import 'package:architecture/features/domain/entites/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required basket,
    required delivery,
    required idCart,
    required total
}) : super (
    basket: basket,
    delivery: delivery,
    idCart: idCart,
    total: total
  );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        basket: json['basket'] != null
            ? (json['basket'] as List<dynamic>)
            .map((json) => BasketModel.fromJson(json)).toList()
            : null,
        delivery: json['delivery'],
        idCart: json['id'],
        total: json['total']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'basket': basket,
      'delivery': delivery,
      'idCart': idCart,
      'total': total
    };
  }

}
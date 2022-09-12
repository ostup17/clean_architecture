import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String delivery;
  final String idCart;
  final int total;
  final List<Basket> basket;

  const CartEntity({
      required this.delivery,
      required this.idCart,
      required this.total,
      required this.basket
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    basket,
    delivery,
    idCart,
    total
  ];
}

class Basket {
  final int id;
  final String images;
  final int price;
  final String title;

  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title});
}
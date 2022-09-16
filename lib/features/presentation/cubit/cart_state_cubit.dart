import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {

  const CartState();

  @override
  List<Object> get props => [];
}

class CartEmpty extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  final List<CartEntity> oldCartList;

  const CartLoading(this.oldCartList); //Подгрузка персонажей

  @override
  List<Object> get props => [oldCartList];
}

class CartLoaded extends CartState {
  final List<CartEntity> cartList;

  CartLoaded(this.cartList);

  @override
  List<Object> get props => [cartList];
}

class CartError extends CartState {
  final String message;

  CartError({required this.message});
  @override
  List<Object> get props => [message];
}
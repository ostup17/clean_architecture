import 'dart:convert';

import 'package:architecture/core/error/exception.dart';
import 'package:architecture/features/data/model/cart_model.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>>getAllCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CartModel>> getAllCart() async {
    final response = await client.get(
        Uri.parse(ConfigUrl.cart),
        headers: {'Content-Type': 'application/json'}
    );
    if(response.statusCode == 200) {
      List<CartModel> result =[];
      CartModel cart = CartModel.fromJson(json.decode(response.body));
      result.add(cart);
      return result;
      // final cart = json.decode(response.body);
      // print(cart);
      // return (cart as List).map((cart) => CartModel.fromJson(cart)).toList();
    } else {
      throw ServerException();
    }
  }
  
}

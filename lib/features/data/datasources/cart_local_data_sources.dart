import 'package:architecture/core/error/exception.dart';
import 'package:architecture/features/data/model/details_model.dart';
import 'package:architecture/features/data/model/hot_sales_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/cart_model.dart';

abstract class CartLocalDataSources {
  //Эти методы будут генерировать исключения, который мы реализованы в core/error/exception.dart
  Future<List<CartModel>> getLastCartFromCash();
  Future<void> getCartToCache(List<CartModel> cart);
}
const CACHED_CART_LIST = 'CACHED_CART_LIST';
class CartLocalDataSourceImpl implements CartLocalDataSources {
  final SharedPreferences sharedPreferences;
  CartLocalDataSourceImpl({required this.sharedPreferences}); //подключаем localStorage
  @override
  Future<void> getCartToCache(List<CartModel> cart) {
    final List<String> jsonCartList = cart.map((cart) => json.encode(cart.toJson())).toList();
    sharedPreferences.setStringList(CACHED_CART_LIST, jsonCartList);
    return Future.value(jsonCartList);
  }

  @override
  Future<List<CartModel>> getLastCartFromCash() {
    final jsonCartList = sharedPreferences.getStringList(CACHED_CART_LIST);
    if(jsonCartList!.isNotEmpty) {
      return Future.value(jsonCartList.map((cart) => CartModel.fromJson(json.decode(cart))).toList());
    } else {
      throw CacheException();
    }
  }

}
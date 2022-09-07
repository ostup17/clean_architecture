import 'package:architecture/core/error/exception.dart';
import 'package:architecture/features/data/model/best_seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class BestSellerLocalDataSources {
  //Эти методы будут генерировать исключения, который мы реализованы в core/error/exception.dart
  Future<List<BestSellerModel>> getLastBestSellerFromCash();
  Future<void> getBestSellerToCache(List<BestSellerModel> bestSeller);
}
const CACHED_BEST_SELLER_LIST = 'CACHED_BEST_SELLER_LIST';
class BestSellerLocalDataSourceImpl implements BestSellerLocalDataSources {
  final SharedPreferences sharedPreferences;
  BestSellerLocalDataSourceImpl({required this.sharedPreferences}); //подключаем localStorage
  @override
  Future<void> getBestSellerToCache(List<BestSellerModel> bestSeller) {
    final List<String> jsonBestSeller = bestSeller.map((bestSeller) => json.encode(bestSeller.toJson())).toList();
    sharedPreferences.setStringList(CACHED_BEST_SELLER_LIST, jsonBestSeller);
    print('saving data in localstorage: ${jsonBestSeller.length}');
    return Future.value(jsonBestSeller);
  }

  @override
  Future<List<BestSellerModel>> getLastBestSellerFromCash() {
    final jsonBestSellerList = sharedPreferences.getStringList(CACHED_BEST_SELLER_LIST);
    if(jsonBestSellerList!.isNotEmpty) {
      return Future.value(jsonBestSellerList.map((bestSeller) => BestSellerModel.fromJson(json.decode(bestSeller))).toList());
    } else {
      throw CacheException();
    }
  }

}
import 'package:architecture/core/error/exception.dart';
import 'package:architecture/features/data/model/hot_sales_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class HotSalesLocalDataSources {
  //Эти методы будут генерировать исключения, который мы реализованы в core/error/exception.dart
  Future<List<HotSalesModel>> getLastHotSalesFromCash();
  Future<void> getHotSalesToCache(List<HotSalesModel> hotSales);
}
const CACHED_HOT_SALES_LIST = 'CACHED_HOT_SALES_LIST';
class HotSalesLocalDataSourceImpl implements HotSalesLocalDataSources {
  final SharedPreferences sharedPreferences;
  HotSalesLocalDataSourceImpl({required this.sharedPreferences}); //подключаем localStorage
  @override
  Future<void> getHotSalesToCache(List<HotSalesModel> hotSales) {
    final List<String> jsonHotSalesList = hotSales.map((hotSales) => json.encode(hotSales.toJson())).toList();
    sharedPreferences.setStringList(CACHED_HOT_SALES_LIST, jsonHotSalesList);
    print('saving data in localstorage: ${jsonHotSalesList.length}');
    return Future.value(jsonHotSalesList);
  }

  @override
  Future<List<HotSalesModel>> getLastHotSalesFromCash() {
    final jsonHotSalesList = sharedPreferences.getStringList(CACHED_HOT_SALES_LIST);
    if(jsonHotSalesList!.isNotEmpty) {
      return Future.value(jsonHotSalesList.map((hotSales) => HotSalesModel.fromJson(json.decode(hotSales))).toList());
    } else {
      throw CacheException();
    }
  }
  
}
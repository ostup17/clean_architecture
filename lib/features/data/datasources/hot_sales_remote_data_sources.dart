import 'dart:convert';

import 'package:architecture/core/error/exception.dart';
import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/data/model/hot_sales_model.dart';
import 'package:http/http.dart' as http;

//в этом файле создаем запрос и сохраняем его данные

abstract class HotSalesRemoteDataSurce {
  Future<List<HotSalesModel>>getAllHotSales();
}

class HotSalesRemoteDataSourceImpl implements HotSalesRemoteDataSurce {
  final http.Client client;
  
  HotSalesRemoteDataSourceImpl({required this.client});
  
  @override
  Future<List<HotSalesModel>> getAllHotSales() async {
    final response = await client.get(
        Uri.parse(ConfigUrl.home),
        headers: {'Content-Type': 'application/json'}
        );
    if(response.statusCode == 200) {
      final hotSales = json.decode(response.body);
      print('Data in server: $hotSales');
      return (hotSales['home_store'] as List).map((e) => HotSalesModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

}
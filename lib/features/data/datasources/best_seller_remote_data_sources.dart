import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/data/model/best_seller_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/error/exception.dart';

abstract class BestSellerRemoteDataSources {
  Future<List<BestSellerModel>> getAllBestSeller();
}

class BestSellerRemoteDataSourcesImpl implements BestSellerRemoteDataSources {
  final http.Client client;
  BestSellerRemoteDataSourcesImpl({required this.client});
  @override
  Future<List<BestSellerModel>> getAllBestSeller() async {
    final response = await client.get(
        Uri.parse(ConfigUrl.home),
        headers: {'Content-Type': 'application/json'}
    );
    if(response.statusCode == 200) {
      final bestSeller = json.decode(response.body);
      print('Data in server: $bestSeller');
      return (bestSeller['best_seller'] as List).map((e) => BestSellerModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
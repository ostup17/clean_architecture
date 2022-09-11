import 'dart:convert';

import 'package:architecture/core/error/exception.dart';
import 'package:architecture/features/data/model/details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DetailsLocalDataSources {
  //Эти методы будут генерировать исключения, который мы реализованы в core/error/exception.dart
  Future<List<DetailsModel>> getLastDetailsFromCash();
  Future<void> getDetailsToCache(List<DetailsModel> details);
}

const CACHED_DETAILS_LIST = 'CACHED_DETAILS_LIST';

class DetailsLocalDataSourcesImpl implements DetailsLocalDataSources {
  final SharedPreferences sharedPreferences;
  DetailsLocalDataSourcesImpl({required this.sharedPreferences});

  @override
  Future<void> getDetailsToCache(List<DetailsModel> details) {
    final List<String> jsonDetailsList = details.map((details) => json.encode(details.toJson())).toList();
    sharedPreferences.setStringList(CACHED_DETAILS_LIST, jsonDetailsList);
    return Future.value(jsonDetailsList);
  }

  @override
  Future<List<DetailsModel>> getLastDetailsFromCash() {
    final jsonDetailsList = sharedPreferences.getStringList(CACHED_DETAILS_LIST);
    if(jsonDetailsList!.isNotEmpty) {
      return Future.value(jsonDetailsList.map((details) => DetailsModel.fromJson(json.decode(details))).toList());
    } else {
      throw CacheException();
    }
  }
}
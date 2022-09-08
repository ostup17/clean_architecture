import 'package:architecture/core/error/exception.dart';
import 'package:architecture/core/error/failure.dart';
import 'package:architecture/core/platform/network_info.dart';
import 'package:architecture/features/data/datasources/hot_sales_local_data_sources.dart';
import 'package:architecture/features/data/datasources/hot_sales_remote_data_sources.dart';
import 'package:architecture/features/domain/entites/hot_sales_entity.dart';
import 'package:architecture/features/domain/repositories/hot_sales_repository.dart';
import 'package:dartz/dartz.dart';

class HotSalesRepositoryImpl implements HotSalesRepository {
  final HotSalesRemoteDataSurce remoteDataSurce;
  final HotSalesLocalDataSources localDataSources;
  final NetworkInfo networkInfo;

HotSalesRepositoryImpl({
  required this.networkInfo,
  required this.localDataSources,
  required this.remoteDataSurce
});

  @override
  Future<Either<Failure, List<HotSalesEntity>>> getAllHotSales() async {
    if(await networkInfo.isConnects) {
      try {
        final remoteHotSales = await remoteDataSurce.getAllHotSales();
        localDataSources.getHotSalesToCache(remoteHotSales);
        return Right(remoteHotSales);
      } on ServerException {
        return Left(ServerFailure());
      }

    } else {
      try {
        final locationHotSales = await localDataSources.getLastHotSalesFromCash();
        return Right(locationHotSales);
      } on CacheException {
        return Left(CacheFailure());
      }

    }
  }

}
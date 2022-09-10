import 'package:architecture/core/error/exception.dart';
import 'package:architecture/core/error/failure.dart';
import 'package:architecture/core/platform/network_info.dart';
import 'package:architecture/features/data/datasources/best_seller_local_data_sources.dart';
import 'package:architecture/features/data/datasources/best_seller_remote_data_sources.dart';
import 'package:architecture/features/domain/entites/best_seller_entity.dart';
import 'package:architecture/features/domain/repositories/best_seller_repository.dart';
import 'package:dartz/dartz.dart';

class BestSellerRepositoryImpl implements BestSellerRepository {
  final BestSellerRemoteDataSources remoteDataSources;
  final BestSellerLocalDataSources localDataSources;
  final NetworkInfo networkInfo;

  BestSellerRepositoryImpl({
    required this.networkInfo,
    required this.localDataSources,
    required this.remoteDataSources
  });

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getAllBestSeller() async {
    if(await networkInfo.isConnects) {
      try {
        final remoteBestSeller = await remoteDataSources.getAllBestSeller();
        localDataSources.getBestSellerToCache(remoteBestSeller);
        return Right(remoteBestSeller);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localBestSeller = await localDataSources.getLastBestSellerFromCash();
        return Right(localBestSeller);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}
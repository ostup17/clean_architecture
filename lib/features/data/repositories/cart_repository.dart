import 'package:architecture/core/error/exception.dart';
import 'package:architecture/core/error/failure.dart';
import 'package:architecture/core/platform/network_info.dart';
import 'package:architecture/features/data/datasources/cart_local_data_sources.dart';
import 'package:architecture/features/data/datasources/cart_remote_data_sources.dart';
import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:architecture/features/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final CartLocalDataSources localDataSources;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.networkInfo,
    required this.localDataSources,
    required this.remoteDataSource
});

  @override
  Future<Either<Failure, List<CartEntity>>> getAllCart() async {
    if(await networkInfo.isConnects) {
      try {
        final remoteCart = await remoteDataSource.getAllCart();
        localDataSources.getCartToCache(remoteCart);
        return Right(remoteCart);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationCart = await localDataSources.getLastCartFromCash();
        return Right(locationCart);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
import 'package:architecture/core/error/exception.dart';
import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/data/datasources/details_local_data_sources.dart';
import 'package:architecture/features/data/datasources/details_remote_data_sources.dart';
import 'package:architecture/features/domain/entites/details_entity.dart';
import 'package:architecture/features/domain/repositories/details_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/platform/network_info.dart';

class DetailsRepositoryImpl extends DetailsRepository {
  final DetailsRemoteDataSorce detailsRemoteDataSource;
  final  DetailsLocalDataSources detailsLocalDataSources;
  final NetworkInfo networkInfo;

  DetailsRepositoryImpl({
    required this.networkInfo,
    required this.detailsLocalDataSources,
    required this.detailsRemoteDataSource
});

  @override
  Future<Either<Failure, List<DetailsEntity>>> getAllDetails() async {
    if(await networkInfo.isConnects) {
      try {
        final remoteDetails = await detailsRemoteDataSource.getAllDetails();
        detailsLocalDataSources.getDetailsToCache(remoteDetails);
        return Right(remoteDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationDetails = await detailsLocalDataSources.getLastDetailsFromCash();
        return Right(locationDetails);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
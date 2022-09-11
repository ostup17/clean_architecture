import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/domain/entites/details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepository {
  Future<Either<Failure, List<DetailsEntity>>> getAllDetails();
}
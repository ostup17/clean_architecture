import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/domain/entites/best_seller_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BestSellerRepository {
  Future<Either<Failure, List<BestSellerEntity>>> getAllBestSeller();
}
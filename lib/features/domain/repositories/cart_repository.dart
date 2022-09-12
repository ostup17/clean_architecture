
import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getAllCart();
}
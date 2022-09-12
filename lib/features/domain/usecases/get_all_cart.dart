import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:architecture/features/presentation/cubit/cart_state_cubit.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cart_repository.dart';

class GetAllCart {
  final CartRepository cartRepository;
  GetAllCart(this.cartRepository);

  Future<Either<Failure, List<CartEntity>>> call() async {
    return await cartRepository.getAllCart();
  }
}
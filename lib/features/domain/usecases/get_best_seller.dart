import 'package:architecture/features/domain/repositories/best_seller_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entites/best_seller_entity.dart';

class GetAllBestSeller {
  final BestSellerRepository bestSellerRepository;
  GetAllBestSeller(this.bestSellerRepository);

  Future<Either<Failure, List<BestSellerEntity>>> call() async {
    return await bestSellerRepository.getAllBestSeller();
  }
}
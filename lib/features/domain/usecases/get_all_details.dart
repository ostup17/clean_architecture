import 'package:architecture/features/domain/repositories/details_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/details_entity.dart';

class GetAllDetails {
  final DetailsRepository detailsRepository;
  GetAllDetails(this.detailsRepository);

  Future<Either<Failure, List<DetailsEntity>>> call() async {
    return await detailsRepository.getAllDetails();
  }
}
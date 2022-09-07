import 'package:architecture/features/domain/repositories/hot_sales_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entites/hot_sales_entity.dart';
//получать данные из репозитория
class GetAllHotSales {
  final HotSalesRepository hotSalesRepository; //переменная для хранения данных из репозитория
  GetAllHotSales(this.hotSalesRepository);

  Future<Either<Failure, List<HotSalesEntity>>> call() async { //call - функция которую создаю здесь
    return await hotSalesRepository.getAllHotSales(); // getAllHotSales - функция, которую создал в репозитории
  }
}
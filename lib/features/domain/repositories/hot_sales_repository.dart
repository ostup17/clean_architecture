import 'package:architecture/features/domain/entites/hot_sales_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart'; //для обработки ошибок - Either<L(слева ошибка), R(справа если все ок)>
//Класс должен быть всегда абстрактным.
//Здесь мы описываем метод, что он будет делать (Получать все товары для скидок)
abstract class HotSalesRepository {
  Future<Either<Failure, List<HotSalesEntity>>> getAllHotSales();
}
import 'package:architecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
//
// //Type - для возврата в случае, если нет ошибок (Например, HotSalesEntity); Params - вызовет изменения кода в наших usescases(domain)
// abstract class UseCase<Type, Params> {
//  Future<Either<Failure, Type>> call(Params params);
// }
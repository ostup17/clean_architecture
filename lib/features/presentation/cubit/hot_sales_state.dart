import 'package:architecture/features/domain/entites/hot_sales_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HotSalesState extends Equatable {

 const HotSalesState();

  @override
  List<Object> get props => [];
}

class HotSalesEmpty extends HotSalesState {
  @override
  List<Object> get props => [];
}

class HotSalesLoading extends HotSalesState {
  final List<HotSalesEntity> oldHotSalesList;

  const HotSalesLoading(this.oldHotSalesList); //Подгрузка персонажей

  @override
  List<Object> get props => [oldHotSalesList];
}

class HotSalesLoaded extends HotSalesState {
  final List<HotSalesEntity> hotSalesList;

  HotSalesLoaded(this.hotSalesList);

  @override
  List<Object> get props => [hotSalesList];
}

class HotSalesError extends HotSalesState {
  final String message;

  HotSalesError({required this.message});
  @override
  List<Object> get props => [message];
}
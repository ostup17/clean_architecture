import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entites/details_entity.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailsEmpty extends DetailsState {
  @override
  List<Object> get props => [];
}

class DetailsLoading extends DetailsState {
  final List<DetailsEntity> oldDetailList;

  const DetailsLoading(this.oldDetailList); //Подгрузка персонажей

  @override
  List<Object> get props => [oldDetailList];
}

class DetailsLoaded extends DetailsState {
  final List<DetailsEntity> detailList;

  const DetailsLoaded(this.detailList);

  @override
  List<Object> get props => [detailList];
}

class DetailsError extends DetailsState {
  final String message;

  const DetailsError({required this.message});
  @override
  List<Object> get props => [message];
}
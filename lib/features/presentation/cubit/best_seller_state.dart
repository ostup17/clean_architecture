import 'package:equatable/equatable.dart';

import '../../domain/entites/best_seller_entity.dart';

abstract class BestSellerState extends Equatable {

  const BestSellerState();

  @override
  List<Object> get props => [];
}

class BestSellerEmpty extends BestSellerState {
  @override
  List<Object> get props => [];
}

class BestSellerLoading extends BestSellerState {
  final List<BestSellerEntity> oldBestSellerList;

  BestSellerLoading(this.oldBestSellerList); //Подгрузка персонажей

  @override
  List<Object> get props => [oldBestSellerList];
}

class BestSellerLoaded extends BestSellerState {
  final List<BestSellerEntity> bestSellerList;

  BestSellerLoaded(this.bestSellerList);

  @override
  List<Object> get props => [bestSellerList];
}

class BestSellerError extends BestSellerState {
  final String message;

  BestSellerError({required this.message});
  @override
  List<Object> get props => [message];
}
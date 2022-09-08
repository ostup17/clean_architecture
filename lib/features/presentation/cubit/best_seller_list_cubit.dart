

import 'package:architecture/features/presentation/cubit/best_seller_state.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failure.dart';
import '../../domain/usecases/get_best_seller.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class BestSellerCubit extends Cubit<BestSellerState> {
  final GetAllBestSeller getAllBestSeller;
  BestSellerCubit({required this.getAllBestSeller}) : super(BestSellerEmpty());

  void loadBestSeller() async {
    if(state is BestSellerLoading) return;

    final failureOrBestSeller = await getAllBestSeller();

    failureOrBestSeller.fold((error) => BestSellerError(message: _mapFailureToMessage(error)), (character) {
      final bestSeller = (state as BestSellerLoading).oldBestSellerList;
      bestSeller.addAll(character);
      emit(BestSellerLoaded(bestSeller));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

}
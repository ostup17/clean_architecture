import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_all_hot_sales.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class HotSalesCubit extends Cubit<HotSalesState> {
  final GetAllHotSales getAllHotSales;
  HotSalesCubit({required this.getAllHotSales}) : super(HotSalesEmpty());

  void loadHotSales() async {
    if(state is HotSalesLoading) return;

    final failureOrHotSales = await getAllHotSales();

    failureOrHotSales.fold((error) => HotSalesError(message: _mapFailureToMessage(error)), (character) {
      if(state is HotSalesLoading) {
        final hotSales = (state as HotSalesLoading).oldHotSalesList;
        hotSales.addAll(character);
        emit(HotSalesLoaded(hotSales));
      }
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
import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/domain/entites/details_entity.dart';
import 'package:architecture/features/domain/entites/hot_sales_entity.dart';
import 'package:architecture/features/domain/usecases/get_all_details.dart';
import 'package:architecture/features/presentation/cubit/details_state.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../domain/usecases/get_all_hot_sales.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class DetailsCubit extends Cubit<DetailsState> {
  final GetAllDetails getAllDetails;
  DetailsCubit({required this.getAllDetails}) : super(DetailsEmpty());

  void loadDetails() async {
    if (state is DetailsLoading) return;

    final currentState = state;
    var oldDetails = <DetailsEntity>[];

    if (currentState is DetailsLoaded) {
      oldDetails = currentState.detailList;
    }

    emit(DetailsLoading(oldDetails));

    final failureOrDetails = await getAllDetails();

    failureOrDetails.fold((error) => DetailsError(message: _mapFailureToMessage(error)), (character) {
      final details = (state as DetailsLoading).oldDetailList;
      details.addAll(character);
      emit(DetailsLoaded(character));
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
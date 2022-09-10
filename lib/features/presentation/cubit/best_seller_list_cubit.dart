import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/domain/entites/best_seller_entity.dart';

import 'package:architecture/features/domain/usecases/get_best_seller.dart';
import 'package:architecture/features/presentation/cubit/best_seller_state.dart';


import 'package:flutter_bloc/flutter_bloc.dart';






const SERVER_FAILURE_MESSAGE = 'Server Failure';

const CACHED_FAILURE_MESSAGE = 'Cache Failure';



class BestSellerCubit extends Cubit<BestSellerState> {

  final GetAllBestSeller getBestSeller;

  BestSellerCubit({required this.getBestSeller}) : super(BestSellerEmpty());



  void loadBestSeller() async {

    if (state is BestSellerLoading) return;



    final currentState = state;



    var oldBestSeller = <BestSellerEntity>[];

    if (currentState is BestSellerLoaded) {

      oldBestSeller = currentState.bestSellerList;

    }



    emit(BestSellerLoading(oldBestSeller));



    final failureOrBestSeller = await getBestSeller();



    failureOrBestSeller

        .fold((error) => BestSellerError(message: _mapFailureToMessage(error)),

            (character) {

          final bestSeller = (state as BestSellerLoading).oldBestSellerList;

          bestSeller.addAll(character);

          print('List length: ${bestSeller.length.toString()}');

          emit(BestSellerLoaded(character));

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
import 'package:architecture/core/error/failure.dart';
import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:architecture/features/domain/usecases/get_all_cart.dart';
import 'package:architecture/features/presentation/cubit/cart_state_cubit.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class CartCubit extends Cubit<CartState> {
  final GetAllCart getAllCart;
  CartCubit({required this.getAllCart}) : super(CartEmpty());

  void loadCart() async {
    if (state is CartLoading) return;

    final currentState = state;
    var oldCart = <CartEntity>[];

    if (currentState is CartLoaded) {
      oldCart = currentState.cartList;
    }

    emit(CartLoading(oldCart));

    final failureOrHotSales = await getAllCart();

    failureOrHotSales.fold((error) => HotSalesError(message: _mapFailureToMessage(error)), (character) {
      final cart = (state as CartLoading).oldCartList;
      cart.addAll(character);
      emit(CartLoaded(character));
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
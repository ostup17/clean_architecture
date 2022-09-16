import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/presentation/cubit/details_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../locator_service.dart';
import '../../../domain/entites/cart_entity.dart';
import '../../cubit/cart_list_cubit.dart';
import '../../cubit/cart_state_cubit.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
            create: (context) => sl<CartCubit>()..loadCart()),
      ],
      child: const Scaffold(
        body: FooterResult(),
      ),
    );
  }
}

class FooterResult extends StatelessWidget {
  const FooterResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      List<CartEntity> cart = [];
      if (state is CartLoading) {
        return Text('sfs');
      } else if (state is CartLoaded) {
        cart = state.cartList;
      }
      return BottomAppBar(
          color: configColors.bgHome,
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: configColors.darkBlue,
            ),
            height: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: const Text(
                        'Explorer',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Mark-Pro"),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    IconButton(
                        onPressed: () async {
                          context.go('/cart');
                        },
                        icon: Image.asset(
                          'assets/image/vector1.png',
                          color: Colors.white,
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: cart.isNotEmpty
                            ? Text(
                                '${cart[0].basket.length}',
                                style: TextStyle(
                                    color: configColors.orange,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Mark-Pro",
                                    fontSize: 15),
                              )
                            : Text(
                                '${cart[0].basket.length}}',
                                style: TextStyle(
                                    color: configColors.darkBlue,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Mark-Pro",
                                    fontSize: 15),
                              ))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {},
                    icon: const Icon(Icons.person_outline, color: Colors.white))
              ],
            ),
          ));
    });
  }
}

import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/domain/entites/cart_entity.dart';
import 'package:architecture/features/presentation/cubit/cart_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/cart_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../locator_service.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(create: (context) => sl<CartCubit>()..loadCart()),
      ],
      child: Scaffold(
        body: CartBody(),
      ),
    );
  }
}

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          List<CartEntity> cart = [];
          if (state is CartLoading) {
            return _loadingIndicator();
          } else if (state is CartLoaded) {
            cart = state.cartList;
          }
          return Scaffold(
            backgroundColor: configColors.bgHome,
            body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 66),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 37,
                              height: 37,
                              decoration: BoxDecoration(
                                  color: configColors.darkBlue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {
                                    context.go('/home');
                                  },
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                  )),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    'Add address',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Mark-Pro",
                                        fontSize: 15,
                                        color: configColors.darkBlue),
                                  ),
                                ),
                                Container(
                                  width: 37,
                                  height: 37,
                                  decoration: BoxDecoration(
                                      color: configColors.orange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.place_outlined,
                                        size: 17,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Align(
                            alignment: Alignment(-0.5, -1.0),
                            child: Text(
                              'My Cart',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: "Mark-Pro",
                                  fontWeight: FontWeight.w700,
                                  color: configColors.darkBlue),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 49),
                          decoration: BoxDecoration(
                            color: configColors.darkBlue,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ListView.builder(
                                  controller: controller,
                                  shrinkWrap: true,
                                  itemCount: cart[0].basket.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  // margin: EdgeInsets.only(top: 15),
                                                  width: 88,
                                                  height: 88,
                                                  // margin: EdgeInsets.only(top: 15),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.network(
                                                      cart[0].basket[index].images,
                                                      width: 88,
                                                      height: 88,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 153,
                                                      child: Text(
                                                        cart[0].basket[index].title.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontFamily: "Mark-Pro",
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child: Text(
                                                        '\$ ${cart[0].basket[index].price.toString()}',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily: "Mark-Pro",
                                                            color: configColors.orange,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            color: HexColor('#282843'),
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                26)),
                                                        height: 68,
                                                        width: 26,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: const [
                                                            InkWell(
                                                              child: Text(
                                                                '-',
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              child: Text('1',
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontFamily:
                                                                      "Mark-Pro",
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                      fontSize: 20)),
                                                            ),
                                                            InkWell(
                                                              child: Text('+',
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 16)),
                                                            )
                                                          ],
                                                        )),
                                                    Container(
                                                      child: IconButton(
                                                          onPressed: () {},
                                                          icon: Image.asset(
                                                              'assets/image/group.png')),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ));
                                  }),
                              Container(
                                margin: const EdgeInsets.only(top: 171),
                                decoration: BoxDecoration(
                                    color: configColors.darkBlue,
                                    border: Border(
                                      top: BorderSide(
                                          width: 2,
                                          color: Colors.white.withOpacity(0.25)),
                                      bottom: BorderSide(
                                          width: 2,
                                          color: Colors.white.withOpacity(0.25)),
                                    )),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(55, 0, 35, 0),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Total',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Mark-Pro",
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '\$${cart[0].total} us',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Mark-Pro",
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.fromLTRB(0, 12, 0, 26),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Delivery',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Mark-Pro",
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(right: 35),
                                                child: Text(
                                                  cart[0].delivery,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: "Mark-Pro",
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 27, 0, 44),
                                  width: 326,
                                  height: 54,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: configColors.orange),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: configColors.orange,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Mark-Pro"),
                                    ),
                                    child: const Text('Checkout'),
                                  ))
                            ],
                          )
                          ),
                    ],
                  ),
                )),
          );
        }
    );
  }
  Widget _loadingIndicator() {
    return Padding(padding: const EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

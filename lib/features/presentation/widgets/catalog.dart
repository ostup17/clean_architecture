import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/domain/entites/best_seller_entity.dart';
import 'package:architecture/features/presentation/cubit/best_seller_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/best_seller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../locator_service.dart';
import 'favorite.dart';


class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BestSellerCubit>(create: (context) => sl<BestSellerCubit>()..loadBestSeller())
      ],
      child: MaterialApp(
        home: CatalogBuild(),
      ),
    );
  }
}

class CatalogBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
          List<BestSellerEntity> bestSeller = [];
          if(state is BestSellerLoading) {
            return _loadingIndicator();
          } else if (state is BestSellerLoaded) {
            bestSeller = state.bestSellerList;
          }
         return GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.5 / 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12),
              itemCount: bestSeller.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                    onTap: () async {
                        context.go('/Details');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(
                                10)),
                        width: 181,
                        height: 227,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 187,
                                    height: 168,
                                    margin:
                                    const EdgeInsets
                                        .only(
                                        top: 5),
                                    child: Image.network(
                                      bestSeller[
                                        index].picture),
                                  ),
                                  Container(
                                      margin: const EdgeInsets
                                          .fromLTRB(
                                          0, 11, 4, 0),
                                      child: Align(
                                          alignment:
                                          Alignment
                                              .topRight,
                                          child:
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    configColors.lightGrey,
                                                    spreadRadius:
                                                    2,
                                                    blurRadius:
                                                    20,
                                                    offset:
                                                    const Offset(1, 1), // changes position of shadow
                                                  ),
                                                ],
                                                color: Colors.white),
                                            child: const Align(
                                                alignment:
                                                Alignment
                                                    .center,
                                                child:
                                                Favorite()),
                                          )))
                                ],
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets
                                    .only(left: 21),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${bestSeller[index].priceWithoutDiscount}',
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .w700,
                                              color: configColors
                                                  .darkBlue,
                                              fontSize:
                                              16,
                                              fontFamily:
                                              "Mark-Pro"),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .fromLTRB(
                                              7,
                                              8,
                                              0,
                                              0),
                                          child: Text(
                                            '${bestSeller[index].discountPrice}',
                                            style: TextStyle(
                                                decoration:
                                                TextDecoration
                                                    .lineThrough,
                                                fontWeight:
                                                FontWeight
                                                    .w500,
                                                color: configColors
                                                    .lightGrey,
                                                fontSize:
                                                10,
                                                fontFamily:
                                                "Mark-Pro"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                      const EdgeInsets
                                          .only(
                                          top: 6),
                                      child: Text(
                                       bestSeller[
                                        index].title,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .w400,
                                            color: configColors
                                                .darkBlue,
                                            fontSize:
                                            10,
                                            fontFamily:
                                            "Mark-Pro"),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )));
              });
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
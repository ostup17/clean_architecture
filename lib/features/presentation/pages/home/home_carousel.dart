import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/domain/entites/hot_sales_entity.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_state.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_colors.dart';
import '../../../../locator_service.dart';


class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotSalesCubit>(create: (context) => sl<HotSalesCubit>()..loadHotSales()),
      ],
      child: Scaffold(
        body: CarouselBuild(),
      ),
    );
  }
}

class CarouselBuild extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotSalesCubit, HotSalesState>(
        builder: (context, state) {
          List<HotSalesEntity> hotSales = [];
          if(state is HotSalesLoading) {
            return _loadingIndicator();
          } else if(state is HotSalesLoaded) {
            hotSales = state.hotSalesList;
          }
          print('Data in List View Builder $hotSales');
          return CarouselSlider.builder(
            itemCount: hotSales.length,
            carouselController: buttonCarouselController,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  child: Container(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 182,
                          width: 378,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                hotSales[itemIndex].picture,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // if(HomeStore.HSisNew[itemIndex] == true) {
                                //   return Container(
                                //   child: Text('new'),
                                //   )
                                // }
                                Container(
                                    margin: const EdgeInsets.fromLTRB(32, 15, 0, 0),
                                    width: 27,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        color: hotSales[itemIndex].isNew == null
                                            ? Colors.transparent
                                            : configColors.orange,
                                        borderRadius: BorderRadius.circular(50)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'new',
                                        style: TextStyle(
                                            color: hotSales[itemIndex].isNew == null
                                                ? Colors.transparent
                                                : Colors.white,
                                            fontFamily: "SFP",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(left: 32),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(top: 18),
                                            child: Text(
                                              hotSales[itemIndex].title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25,
                                                  fontFamily: 'SFP'),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Text(hotSales[itemIndex].subTitle,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  fontFamily: 'SFP')),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 26, 0, 20),
                                          child: ConstrainedBox(
                                              constraints: const BoxConstraints.tightFor(
                                                  width: 98, height: 23),
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                  },
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(5),
                                                            side: const BorderSide(
                                                                color: Colors.white))),
                                                    backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        Colors.white),
                                                  ),
                                                  child: Text(
                                                    'Buy now!',
                                                    style: TextStyle(
                                                        color: configColors.darkBlue,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 11,
                                                        fontFamily: 'SFP'),
                                                  ))),
                                        )
                                      ],
                                    ))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
            options: CarouselOptions(
              height: 210,
              viewportFraction: 1,
            ),
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
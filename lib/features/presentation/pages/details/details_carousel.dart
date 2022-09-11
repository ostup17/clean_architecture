import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/domain/entites/hot_sales_entity.dart';
import 'package:architecture/features/presentation/cubit/details_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/details_state.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/hot_sales_state.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_colors.dart';
import '../../../../locator_service.dart';
import '../../../domain/entites/details_entity.dart';


class CarouselDetails extends StatelessWidget {
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
    return BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          List<DetailsEntity> details = [];
          if(state is DetailsLoading) {
            return _loadingIndicator();
          } else if(state is DetailsLoaded) {
            details = state.detailList;
          }
          print(1233);
          print('asdasd');
          print(1233);
          print('qqqqq');
          print('Data in List View Builder $details');
          return CarouselSlider.builder(
            itemCount: details[0].images.length,
            carouselController: buttonCarouselController,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(top: 44),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(details[itemIndex].images.toString()),
                  ),
                ),
            options: CarouselOptions(
              enlargeCenterPage: true,
              height: 345,
              viewportFraction: 0.7,
            ),
          );
        }
    );
  }
  Widget _loadingIndicator() {
    return const Padding(padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
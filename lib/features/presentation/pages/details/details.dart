import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/domain/entites/details_entity.dart';
import 'package:architecture/features/presentation/cubit/details_list_cubit.dart';
import 'package:architecture/features/presentation/cubit/details_state.dart';
import 'package:architecture/features/presentation/pages/details/details_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../locator_service.dart';
import '../../widgets/details_favorite.dart';
import 'details_carousel.dart';
import 'details_characteristics.dart';


class Details extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsCubit>(create: (context) => sl<DetailsCubit>()..loadDetails()),
      ],
      child: Scaffold(
        body: DetailsBody(),
      ),
    );
  }
}

class DetailsBody extends StatefulWidget {
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  CarouselController buttonCarouselController = CarouselController();
  int selectedIndexColor = 0;
  int selectedIndexSsd = 0;

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
          return Scaffold(
              backgroundColor: configColors.bgHome,
              body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 66),
                            child: Header()
                        ),
                        CarouselDetails(),
                        Container(
                          margin: const EdgeInsets.only(top: 7),
                          padding: const EdgeInsets.fromLTRB(38, 28, 30, 58),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    details[0].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        fontFamily: "Mark-Pro"),
                                  ),
                                  Container(
                                    width: 37,
                                    height: 33,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: configColors.darkBlue),
                                    child: (const FavoriteDetails()),
                                  )
                                ],
                              ),
                              RatingBarIndicator(
                                  rating: details[0].rating,
                                  itemSize: 28,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: configColors.gold,
                                  )),
                              DefaultTabController(
                                length: 3, // length of tabs
                                initialIndex: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(top: 32),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor: configColors.darkBlue,
                                        labelStyle: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Mark-Pro",
                                            fontWeight: FontWeight.w700),
                                        unselectedLabelColor: configColors.lightGrey,
                                        indicatorColor: configColors.orange,
                                        indicatorWeight: 3,
                                        tabs: const [
                                          Tab(
                                            text: 'Shop',
                                          ),
                                          Tab(
                                            text: 'Details',
                                          ),
                                          Tab(
                                            text: 'Featuresas',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        height: 280, //height of TabBarView
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.grey, width: 0.5))),
                                        child: TabBarView(children: <Widget>[
                                          Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                characteristics(
                                                    details[0].cpu, 'cpu.png'),
                                                characteristics(
                                                    details[0].camera, 'camera.png'),
                                                characteristics(
                                                    details[0].sd, 'sd.png'),
                                                characteristics(
                                                    details[0].ssd, 'ssd.png'),
                                              ],
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  margin: const EdgeInsets.only(top: 29),
                                                  child: Text(
                                                    'Select color and capacity',
                                                    style: TextStyle(
                                                        color: configColors.darkBlue,
                                                        fontFamily: "Mark-Pro",
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                )),
                                            Container(
                                                margin: const EdgeInsets.only(top: 14.71),
                                                width: 400,
                                                height: 50,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                          Axis.horizontal,
                                                          shrinkWrap: true,
                                                          itemCount: details[0].color.length,
                                                          itemBuilder:
                                                              (BuildContext ctx, index) {
                                                            return Row(
                                                              // mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      selectedIndexColor =
                                                                          index;
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    width: 39.3,
                                                                    height: 39.3,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            50),
                                                                        color: HexColor(details[index].color.toString())),
                                                                    child: Icon(
                                                                      Icons.check,
                                                                      color: selectedIndexColor ==
                                                                          index
                                                                          ? Colors.white
                                                                          : HexColor(details[index].color.toString())),
                                                                    ),
                                                                  ),
                                                                const SizedBox(
                                                                  width: 18,
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                          Axis.horizontal,
                                                          shrinkWrap: true,
                                                          itemCount: details[0].capacity.length,
                                                          itemBuilder:
                                                              (BuildContext ctx, index) {
                                                            return Row(
                                                              // mainAxisAlignment: MainAxisAlignment.start,
                                                              children: <Widget>[
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      selectedIndexSsd =
                                                                          index;
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                      width: 71.4,
                                                                      height: 30.3,
                                                                      decoration: BoxDecoration(
                                                                          color: selectedIndexSsd == index
                                                                              ? configColors.orange
                                                                              : Colors.white,
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              10)),
                                                                      child: Align(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        child: Text(
                                                                          details[index].capacity.toString(),
                                                                          style:
                                                                          TextStyle(
                                                                            color: selectedIndexSsd ==
                                                                                index
                                                                                ? Colors.white
                                                                                : configColors.textStorage,
                                                                          ),
                                                                        ),
                                                                      )),
                                                                ),
                                                                const SizedBox(
                                                                  width: 18,
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                    )
                                                  ],
                                                )),
                                            Container(
                                              margin: const EdgeInsets.only(top: 27),
                                              height: 54,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: configColors.orange,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10.0)),
                                                ),
                                                onPressed: () {},
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: configColors.orange,
                                                        borderRadius:
                                                        BorderRadius.circular(10)),
                                                    child: InkWell(
                                                      onTap: () async {},
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                        children: [
                                                          const Text(
                                                            'Add to Cart',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Mark-Pro",
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight.w700),
                                                          ),
                                                          Text(
                                                            '\$${details[5]}',
                                                            style: const TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Mark-Pro",
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight.w700),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ]),
                                          Container(
                                            child: const Center(
                                              child: Text('Display Tab 2',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            child: const Center(
                                              child: Text('Display Tab 3',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                        ]))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )));
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

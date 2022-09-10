import 'package:architecture/features/data/config.dart';
import 'package:architecture/features/presentation/widgets/catalog.dart';
import 'package:architecture/features/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/home_descriprion_header.dart';
import 'carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _selected = [true, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: configColors.bgHome,
        // backgroundColor: AppColor.bgHome,
        body: Container(
            margin: const EdgeInsets.fromLTRB(17, 38, 33, 0),
            child: SingleChildScrollView (
                child: Column(
                  children: [
                    const Header(),
                    const HomeDescriptionHeader('Select Category'),
                    Container ( margin: EdgeInsets.only(top: 24),
                        child: SingleChildScrollView(
                            child: DefaultTabController(
                              length: 5, // length of tabs
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: configColors.orange,
                                      unselectedLabelColor: Colors.blueGrey,
                                      indicatorColor: Colors.transparent,
                                      onTap: (index) => _selectedState(index),
                                      tabs: [
                                        Tabs('Phones', 'assets/image/phone.png', 0),
                                        Tabs('Computer', 'assets/image/computer.png',
                                            1),
                                        Tabs('Health', 'assets/image/health.png', 2),
                                        Tabs('Books', 'assets/image/books.png', 3),
                                        Tabs('Watch', 'assets/image/phone.png', 4),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 35),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: SizedBox(
                                                height: 44,
                                                width: 200,
                                                child: TextField(
                                                  style: TextStyle(
                                                      color: configColors.darkBlue,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mark-Pro"),
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.search,
                                                        color: configColors.orange,
                                                      ),
                                                      labelText: 'Search',
                                                      labelStyle: TextStyle(
                                                          color: configColors.darkBlue,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "Mark-Pro"),
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(50),
                                                        borderSide: BorderSide.none,
                                                      )),
                                                ),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.only(left: 11),
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                  color: configColors.orange,
                                                  borderRadius:
                                                  BorderRadius.circular(50)),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.qr_code,
                                                      color: Colors.white,
                                                    )),
                                              ))
                                        ]),
                                  ),
                                  const HomeDescriptionHeader('Hot sales'),
                                  Container(
                                    height: 183,
                                    child: Carousel(),
                                  ),
                                  const HomeDescriptionHeader('Best Seller'),
                                  Container(
                                    // margin: EdgeInsets.only(bottom: 30),
                                      height: 500, //height of TabBarView
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey, width: 0.5))),
                                      child: TabBarView(children: <Widget>[

                                        Catalog(),
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
                                        Container(
                                          child: const Center(
                                            child: Text('Display Tab 4',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          child: const Center(
                                            child: Text('Display Tab 5',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        )
                                      ]))
                                ],
                              ),
                            ))),
                  ],
                )
            )
        )
    );
  }
  Widget Tabs(String header, String iconName, int index) {
    return Tab(
      height: 90,
      child: Column(
        children: [
          Container(
            width: 71,
            height: 71,
            decoration: BoxDecoration(
              color:
              _selected[index] == true ? configColors.orange : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(iconName,
                    color: _selected[index] == true
                        ? Colors.white
                        : configColors.grey)),
          ),
          FittedBox(
            child: Text(
              header,
              style: const TextStyle(
                  fontFamily: "Mark-Pro",
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  _selectedState(int index) {
    setState(() {
      switch (index) {
        case 0:
          _selected[0] = true;
          _selected[1] = false;
          _selected[2] = false;
          _selected[3] = false;
          _selected[4] = false;
          break;
        case 1:
          _selected[0] = false;
          _selected[1] = true;
          _selected[2] = false;
          _selected[3] = false;
          _selected[4] = false;
          break;
        case 2:
          _selected[0] = false;
          _selected[1] = false;
          _selected[2] = true;
          _selected[3] = false;
          _selected[4] = false;
          break;
        case 3:
          _selected[0] = false;
          _selected[1] = false;
          _selected[2] = false;
          _selected[3] = true;
          _selected[4] = false;
          break;
        case 4:
          _selected[0] = false;
          _selected[1] = false;
          _selected[2] = false;
          _selected[3] = false;
          _selected[4] = true;
          break;
        default:
          _selected[0] = true;
          _selected[1] = false;
          _selected[2] = false;
          _selected[3] = false;
          _selected[4] = false;
      }
    });
  }
}
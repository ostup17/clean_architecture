import 'dart:core';
import 'dart:async';
import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../locator_service.dart';
import '../../cubit/best_seller_list_cubit.dart';
import '../../cubit/hot_sales_list_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         backgroundColor: configColors.darkBlue,
         body: Align(
             alignment: Alignment.center,
             child: Stack(
               alignment: Alignment.center,
               children: <Widget>[
                 Container(
                   width: 132,
                   height: 132,
                   decoration: BoxDecoration(
                       color: configColors.orange, shape: BoxShape.circle),
                 ),
                 Align(
                     alignment: Alignment(0.53, 0.0),
                     child: Container(
                         width: 194,
                         child: const Text(
                           'Ecommerce Concept',
                           textDirection: TextDirection.ltr,
                           style: TextStyle(
                               fontFamily: "Mark-Pro",
                               color: Colors.white,
                               fontWeight: FontWeight.w800,
                               fontSize: 30),
                           textAlign: TextAlign.left,
                         )))
               ],
             )));
  }
}

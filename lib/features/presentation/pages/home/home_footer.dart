

import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: configColors.bgHome,
        child: Container(
          margin: EdgeInsets.only(top: 30),
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
                        // Details.basketId = [];
                        // Details.basketImages = [];
                        // Details.basketPrice = [];
                        // Details.basketTitle = [];
                        // await ModelCart().response();
                        // if(ControllerCartScreen.response?.statusCode == 200) {
                        //   context.go('/cart');
                        // }

                      },
                      icon: Image.asset(
                        'assets/image/vector1.png',
                        color: Colors.white,
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Details.basketId.isNotEmpty
                          ? Text(
                        '${Details.basketId.length}',
                        style: TextStyle(
                            color: configColors.orange,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Mark-Pro",
                            fontSize: 15),
                      )
                          : Text(
                        '${Details.basketId.length}',
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
  }
}

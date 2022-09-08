import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/app_colors.dart';
import '../../widgets/carousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      // backgroundColor: AppColor.bgHome,
          body: Container(
            margin: const EdgeInsets.fromLTRB(17, 38, 33, 0),
            child: SingleChildScrollView (
              child: Column(
                children: [
                  Carousel()
                ],
              )
            )
      )
    );
  }
}
import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        Text(
          'Product Details',
          style: TextStyle(
              fontFamily: "Mark-Pro",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: configColors.darkBlue),
        ),
        Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              color: configColors.orange,
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              onPressed: () async {

                context.go('/cart');
              },
              icon: Image.asset(
                'assets/image/vector1.png',
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
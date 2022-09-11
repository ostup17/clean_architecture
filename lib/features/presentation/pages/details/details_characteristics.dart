import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';

class characteristics extends StatelessWidget {
  final String imageSrc;
  final String header;
  const characteristics(this.header, this.imageSrc);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(top: 33),
            child: Image.asset('assets/image/$imageSrc')),
        Container(
            margin: const EdgeInsets.only(top: 9),
            child: Text(
              header,
              style: TextStyle(
                  color: configColors.tabDetailsGrey,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Mark-Pro",
                  fontSize: 11),
            ))
      ],
    );
  }
}
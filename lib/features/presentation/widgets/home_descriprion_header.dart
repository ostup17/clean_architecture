import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';

class HomeDescriptionHeader extends StatelessWidget {
  final String header;

  const HomeDescriptionHeader(this.header);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: TextStyle(
                color: configColors.darkBlue,
                fontFamily: "Mark-Pro",
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'view all',
                style: TextStyle(
                    color: configColors.orange,
                    fontFamily: "Mark-Pro",
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}
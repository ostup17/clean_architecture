//иконка для добавления в избранное
import 'package:architecture/features/data/config.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  IconData? _favorite;

  @override
  void initState() {
    _favorite = Icons.favorite_border;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (_favorite == Icons.favorite_border) {
            _favorite = Icons.favorite;
          } else {
            _favorite = Icons.favorite_border;
          }
          setState(() {});
        },
        icon: Icon(
          _favorite,
          color: configColors.orange,
          size: 10,
        ));
  }
}

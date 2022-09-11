import 'package:flutter/material.dart';

//Сохрание состояния для иконки добавляения в избранное
class FavoriteDetails extends StatefulWidget {
  const FavoriteDetails({Key? key}) : super(key: key);

  @override
  _FavoriteDetailsState createState() => _FavoriteDetailsState();
}

class _FavoriteDetailsState extends State<FavoriteDetails> {
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
          color: Colors.white,
          size: 16,
        ));
  }
}



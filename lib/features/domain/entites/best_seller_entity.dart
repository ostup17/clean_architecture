import 'package:equatable/equatable.dart';

class BestSellerEntity extends Equatable {
  final int id;
  final String title;
  final int priceWithoutDiscount;
  final int discountPrice;
  final String picture;

  const BestSellerEntity({
    required this.id,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture
});
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, priceWithoutDiscount, discountPrice, picture];
}
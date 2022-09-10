import 'package:architecture/features/domain/entites/hot_sales_entity.dart';

//Создаем модель
class HotSalesModel extends HotSalesEntity{
  HotSalesModel({
    required id,
    required isNew,
    required title,
    required subTitle,
    required picture
}) : super(
    id: id,
    isNew: isNew,
    title: title,
    subTitle: subTitle,
    picture: picture
  );

  factory HotSalesModel.fromJson(Map<String, dynamic> json) {
    return HotSalesModel(
        id: json['id'],
        isNew: json['is_new'],
        title: json['title'],
        subTitle: json['subtitle'],
        picture: json['picture']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isNew': isNew,
      'title': title,
      'subTitle': subTitle,
      'picture': picture
    };
  }

}
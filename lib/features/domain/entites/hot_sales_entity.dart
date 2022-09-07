import 'package:equatable/equatable.dart';
//создаем класс исходя из ответа сервера
class HotSalesEntity extends Equatable{
  final int id;
  final bool isNew;
  final String title;
  final String subTitle;
  final String picture;
//Создаем конструктор
  const HotSalesEntity({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subTitle,
    required this.picture
  });
  //Props для Equatable, чтобы можно было легко сравнивать данные
  @override
  // TODO: implement props
  List<Object?> get props => [id, isNew, title, subTitle, picture];
}
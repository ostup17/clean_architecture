import 'package:equatable/equatable.dart';

class DetailsEntity extends Equatable {
  final String cpu;
  final String camera;
  final String id;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;
  final List<String> color;
  final List<String> images;
  final List<String> capacity;

  const DetailsEntity({
    required this.cpu,
    required this.camera,
    required this.id,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
    required this.color,
    required this.capacity,
    required this.images
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cpu, camera, id, price, rating, sd, ssd, title, capacity, color, images];
}
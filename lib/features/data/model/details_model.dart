import '../../domain/entites/details_entity.dart';

class DetailsModel extends DetailsEntity {
  DetailsModel({
    required cpu,
    required camera,
    required id,
    required price,
    required rating,
    required sd,
    required ssd,
    required title,
    required color,
    required images,
    required capacity
  }) : super(
    cpu: cpu,
    camera: camera,
    id: id,
    price: price,
    rating: rating,
    sd: sd,
    ssd: ssd,
    title: title,
    color: color,
    capacity: capacity,
    images: images
  );

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
        cpu: json['CPU'],
        camera: json['camera'],
        id: json['id'],
        price: json['price'],
        rating: json['rating'],
        sd: json['sd'],
        ssd: json['ssd'],
        title: json['title'],
        capacity: json['capacity'].cast<String>(),
        color: json['color'].cast<String>(),
        images: json['images'].cast<String>()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpu': cpu,
      'camera': camera,
      'id': id,
      'price': price,
      'rating': rating,
      'sd': sd,
      'ssd': ssd,
      'title': title,
      'capacity': capacity,
      'images': images,
      "color": color
    };
  }
}
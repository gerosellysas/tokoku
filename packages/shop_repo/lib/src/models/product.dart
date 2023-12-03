import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  const Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}

@JsonSerializable()
class Rating extends Equatable {
  final double? rate;
  final int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  const Rating({
    this.rate,
    this.count,
  });

  @override
  List<Object?> get props => [rate, count];
}

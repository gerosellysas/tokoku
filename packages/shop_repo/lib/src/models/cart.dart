import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartProducts>? products;
  final int? v;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });
}

@JsonSerializable()
class CartProducts {
  final int? productId;
  final int? quantity;

  factory CartProducts.fromJson(Map<String, dynamic> json) =>
      _$CartProductsFromJson(json);

  CartProducts({
    required this.productId,
    required this.quantity,
  });
}

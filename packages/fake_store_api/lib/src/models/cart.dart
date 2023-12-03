import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartProducts>? products;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Cart({
    this.id,
    this.userId,
    this.date,
    this.products,
  });
}

@JsonSerializable()
class CartProducts {
  final int? productId;
  final int? quantity;

  factory CartProducts.fromJson(Map<String, dynamic> json) =>
      _$CartProductsFromJson(json);

  CartProducts({
    this.productId,
    this.quantity,
  });
}

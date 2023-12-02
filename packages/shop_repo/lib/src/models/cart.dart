import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartProducts>? products;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  @override
  List<Object?> get props => [id, userId, date, products];
}

@JsonSerializable()
class CartProducts extends Equatable {
  final int? productId;
  final int? quantity;

  factory CartProducts.fromJson(Map<String, dynamic> json) =>
      _$CartProductsFromJson(json);

  const CartProducts({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];
}

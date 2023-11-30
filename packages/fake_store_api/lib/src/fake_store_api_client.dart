import 'package:dio/dio.dart';
import 'package:fake_store_api/src/models/models.dart';

class FakeStoreApiClient {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<User>> fetchUser() async {
    List<User> users = [];
    try {
      Response response = await _dio.get('$_baseUrl/users');
      return (response.data as List).map((e) => User.fromJson(e)).toList();
    } on Exception catch (_) {}
    return users;
  }

  Future<List<Product>> fetchProduct() async {
    List<Product> products = [];
    try {
      Response response = await _dio.get('$_baseUrl/products');
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on Exception catch (_) {}
    return products;
  }

  Future<List<Cart>> fetchCart() async {
    List<Cart> cart = [];
    try {
      Response response = await _dio.get('$_baseUrl/carts');
      return (response.data as List).map((e) => Cart.fromJson(e)).toList();
    } on Exception catch (_) {}
    return cart;
  }
}

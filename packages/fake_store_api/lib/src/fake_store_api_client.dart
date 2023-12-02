import 'package:dio/dio.dart';
import 'package:fake_store_api/src/models/models.dart';

class FakeStoreApiClient {
  final Dio _dio;
  final String _baseUrl;

  FakeStoreApiClient({Dio? dio, String? baseUrl})
      : _dio = dio ?? Dio(),
        _baseUrl = baseUrl ?? 'https://fakestoreapi.com';

  Future<List<User>> fetchUser() async {
    try {
      Response response = await _dio.get('$_baseUrl/users');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((u) => User.fromJson(u)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<String> postUser(String username, String password) async {
    try {
      Response response = await _dio.post(
        '$_baseUrl/auth/login',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode != 200) return '';
      return response.data;
    } catch (e) {
      return '';
    }
  }

  Future<List<Product>> fetchProduct() async {
    try {
      Response response = await _dio.get('$_baseUrl/products');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((p) => Product.fromJson(p)).toList();
    } catch (_) {
      return [];
    }
  }

  // Future<List<Product>> fetchSingleProduct(String keyword) async {
  //   final products = await fetchProduct();
  //   var temp = <Product>[];
  //   await Future.forEach(products, (p) async {
  //     if (p.title!.toLowerCase().contains(keyword.toLowerCase())) {
  //       temp.add(p);
  //     }
  //   });



  //   var validate = products
  //       .any((p) => p.title!.toLowerCase().contains(keyword.toLowerCase()));

  //   if (!validate) return [];

  //   var id = products[index].id;
  //   try {
  //     Response response = await _dio.get('$_baseUrl/products/$id');
  //     if (response.statusCode != 200) return null;
  //     return (response.data).map((p) => Product.fromJson(p));
  //   } catch (_) {
  //     return null;
  //   }
  // }

  Future<List<Cart>> fetchCart() async {
    try {
      Response response = await _dio.get('$_baseUrl/carts');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((c) => Cart.fromJson(c)).toList();
    } catch (_) {
      return [];
    }
  }
}

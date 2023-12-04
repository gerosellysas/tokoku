import 'package:dio/dio.dart';
import 'package:fake_store_api/src/models/models.dart';

class FakeStoreApiClient {
  final Dio _dio;
  final String _baseUrl;

  FakeStoreApiClient({Dio? dio, String? baseUrl})
      : _dio = dio ?? Dio(),
        _baseUrl = baseUrl ?? 'https://fakestoreapi.com';

  Future<List<User>> fetchUsers() async {
    try {
      Response response = await _dio.get('$_baseUrl/users');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((u) => User.fromJson(u)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<Token?> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        '$_baseUrl/auth/login',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode != 200) return null;
      return Token.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<List<Product>> fetchProducts() async {
    try {
      Response response = await _dio.get('$_baseUrl/products');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((p) => Product.fromJson(p)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<Product?> fetchProductById(int id) async {
    try {
      Response response = await _dio.get('$_baseUrl/products/$id');
      if (response.statusCode != 200) return null;
      return Product.fromJson(response.data);
    } catch (_) {
      return null;
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      Response response = await _dio.get('$_baseUrl/products/categories');
      if (response.statusCode != 200) return [];
      return response.data;
    } catch (_) {
      return [];
    }
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    try {
      Response response =
          await _dio.get('$_baseUrl/products/category/$category');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((p) => Product.fromJson(p)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<List<Cart>> fetchCartsByUser(int userId) async {
    try {
      Response response = await _dio.get('$_baseUrl/carts/user/$userId');
      if (response.statusCode != 200) return [];
      return (response.data as List).map((c) => Cart.fromJson(c)).toList();
    } catch (_) {
      return [];
    }
  }
}

import 'package:dio/dio.dart';
import 'package:fake_store_api/fake_store_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fake_store_api_test.mocks.dart';
import 'mock_cart.dart';
import 'mock_product.dart';
import 'mock_user.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late FakeStoreApiClient client;
  late String url;

  group('Fake Store API client', () {
    setUp(() {
      mockDio = MockDio();
      client = FakeStoreApiClient();
      url = 'https://fakestoreapi.com';
    });

    test('fetching Users', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockUser,
        requestOptions: RequestOptions(path: '$url/users'),
      ));

      when(mockDio.get('$url/users', data: mockUser))
          .thenAnswer((_) async => await response);

      final result = await client.fetchUser();

      expect(result.map((u) => u.id).toList(),
          mockUser.map((u) => u['id']).toList());

      expect(result.map((u) => u.username).toList(),
          mockUser.map((u) => u['username']).toList());

      expect(result.map((u) => u.password).toList(),
          mockUser.map((u) => u['password']).toList());
    });

    test('fetching Products', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockProduct,
        requestOptions: RequestOptions(path: '$url/products'),
      ));

      when(mockDio.get('$url/products', data: mockProduct))
          .thenAnswer((_) async => await response);

      final result = await client.fetchProduct();

      expect(result.map((p) => p.id).toList(),
          mockProduct.map((p) => p['id']).toList());

      expect(result.map((p) => p.title).toList(),
          mockProduct.map((p) => p['title']).toList());

      expect(result.map((p) => p.price).toList(),
          mockProduct.map((p) => p['price']).toList());

      expect(result.map((p) => p.description).toList(),
          mockProduct.map((p) => p['description']).toList());

      expect(result.map((p) => p.category).toList(),
          mockProduct.map((p) => p['category']).toList());

      expect(result.map((p) => p.image).toList(),
          mockProduct.map((p) => p['image']).toList());

      expect(
          result.map((p) => p.rating!.rate).toList(),
          mockProduct
              .map((p) =>
                  Rating.fromJson(p['rating'] as Map<String, dynamic>).rate)
              .toList());

      expect(
          result.map((p) => p.rating!.count).toList(),
          mockProduct
              .map((p) =>
                  Rating.fromJson(p['rating'] as Map<String, dynamic>).count)
              .toList());
    });

    test('fetching Carts', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockCart,
        requestOptions: RequestOptions(path: '$url/carts'),
      ));

      when(mockDio.get('$url/carts', data: mockCart))
          .thenAnswer((_) async => await response);

      final result = await client.fetchCart();

      expect(result.map((c) => c.id).toList(),
          mockCart.map((c) => c['id']).toList());

      expect(result.map((c) => c.userId).toList(),
          mockCart.map((c) => c['userId']).toList());

      expect(result.map((c) => c.date!.toIso8601String()).toList(),
          mockCart.map((c) => c['date']).toList());

      expect(
          result
              .map((c) => c.products!.map((cp) => cp.productId).toList())
              .toList(),
          mockCart
              .map((c) => (c['products'] as List<Map<String, int>>)
                  .map((cp) => CartProducts.fromJson(cp).productId)
                  .toList())
              .toList());

      expect(
          result
              .map((c) => c.products!.map((cp) => cp.quantity).toList())
              .toList(),
          mockCart
              .map((c) => (c['products'] as List<Map<String, int>>)
                  .map((cp) => CartProducts.fromJson(cp).quantity)
                  .toList())
              .toList());
    });
  });
}

import 'package:dio/dio.dart';
import 'package:fake_store_api/fake_store_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fake_store_api_test.mocks.dart';
import 'mock_cart.dart';
import 'mock_product.dart';
import 'mock_token.dart';
import 'mock_user.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late String url;
  late FakeStoreApiClient client;

  setUp(() {
    mockDio = MockDio();
    url = 'https://test.fakestoreapi.com';
    client = FakeStoreApiClient(dio: mockDio, baseUrl: url);
  });

  group('constructor', () {
    test('does not require an mockDio', () {
      expect(FakeStoreApiClient(), isNotNull);
    });
  });

  group('Fake Store API client', () {
    test('fetching Users success', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockUser,
        requestOptions: RequestOptions(path: '$url/users'),
      ));

      when(mockDio.get('$url/users')).thenAnswer((_) async => response);

      final result = await client.fetchUser();

      expect(result.map((u) => u.id).toList(),
          mockUser.map((u) => u['id']).toList());

      expect(result.map((u) => u.username).toList(),
          mockUser.map((u) => u['username']).toList());

      expect(result.map((u) => u.password).toList(),
          mockUser.map((u) => u['password']).toList());
    });

    test('fetching Users failed', () async {
      final response = Future.value(Response(
        statusCode: 403,
        requestOptions: RequestOptions(path: '$url/users'),
      ));

      when(mockDio.get('$url/users')).thenAnswer((_) async => response);

      final result = await client.fetchUser();

      expect(result, []);
    });

    test('post User success', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockToken,
        requestOptions: RequestOptions(path: '$url/auth/login'),
      ));

      when(mockDio.post(
        '$url/auth/login',
        data: {
          'username': mockUser[0]['username'],
          'password': mockUser[0]['password'],
        },
      )).thenAnswer((_) async => response);

      final result = await client.postUser(
        mockUser[0]['username'],
        mockUser[0]['password'],
      );

      expect(result, mockToken);
    });

    test('post User failed', () async {
      final response = Future.value(Response(
        statusCode: 400,
        data: mockToken,
        requestOptions: RequestOptions(path: '$url/auth/login'),
      ));

      when(mockDio.post(
        '$url/auth/login',
        data: {
          'username': mockUser[0]['username'],
          'password': mockUser[0]['password'],
        },
      )).thenAnswer((_) async => response);

      final result = await client.postUser(
        mockUser[0]['username'],
        mockUser[0]['password'],
      );

      expect(result, '');
    });

    test('fetching Products success', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockProduct,
        requestOptions: RequestOptions(path: '$url/products'),
      ));

      when(mockDio.get('$url/products'))
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

    test('fetching Products failed', () async {
      final response = Future.value(Response(
        statusCode: 403,
        requestOptions: RequestOptions(path: '$url/products'),
      ));

      when(mockDio.get('$url/products')).thenAnswer((_) async => response);

      final result = await client.fetchProduct();

      expect(result, []);
    });

    test('fetching Carts success', () async {
      final response = Future.value(Response(
        statusCode: 200,
        data: mockCart,
        requestOptions: RequestOptions(path: '$url/carts'),
      ));

      when(mockDio.get('$url/carts')).thenAnswer((_) async => await response);

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

    test('fetching Carts failed', () async {
      final response = Future.value(Response(
        statusCode: 403,
        requestOptions: RequestOptions(path: '$url/carts'),
      ));

      when(mockDio.get('$url/carts')).thenAnswer((_) async => response);

      final result = await client.fetchCart();

      expect(result, []);
    });
  });
}

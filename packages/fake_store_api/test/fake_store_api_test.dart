import 'package:dio/dio.dart';
import 'package:fake_store_api/fake_store_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fake_store_api_test.mocks.dart';
import 'mock_data/mock.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late Future<Response<dynamic>> mockResponse;
  late String url;
  late FakeStoreApiClient client;

  setUp(() {
    mockDio = MockDio();
    url = 'https://test.fakestoreapi.com';
    client = FakeStoreApiClient(dio: mockDio, baseUrl: url);
  });

  group('test Fake Store API Client', () {
    group('for constructor::', () {
      test('does not require an mockDio', () {
        expect(FakeStoreApiClient(), isNotNull);
      });
    });

    group('for User API::', () {
      group('GET', () {
        group('/user =>', () {
          setUp(() => url = '$url/users');
          test('fetching user success', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockUser,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => mockResponse);

            final result = await client.fetchUsers();
            final matcher = [];

            for (var u in mockUser) {
              matcher.add(User.fromJson(u));
            }

            expect(result.map((u) => u.id).toList(),
                matcher.map((u) => u.id).toList());
            expect(result.map((u) => u.username).toList(),
                matcher.map((u) => u.username).toList());
            expect(result.map((u) => u.password).toList(),
                matcher.map((u) => u.password).toList());
          });

          test('fetching user failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 403,
              data: mockUser,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => mockResponse);

            final result = await client.fetchUsers();
            final matcher = [];

            expect(result, matcher);
          });
        });
      });
    });

    group('for Login API::', () {
      group('POST', () {
        group('/auth/login =>', () {
          setUp(() => url = '$url/auth/login');
          final username = mockUser[0]['username'];
          final password = mockUser[0]['password'];

          test('login success', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockToken,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.post(
              url,
              data: {'username': username, 'password': password},
            )).thenAnswer((_) async => mockResponse);

            final result = await client.login(username, password);
            final matcher = Token.fromJson(mockToken);

            expect(result?.token, matcher.token);
          });

          test('login failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 401,
              data: mockToken,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.post(
              url,
              data: {'username': username, 'password': 'false password'},
            )).thenAnswer((_) async => mockResponse);

            final result = await client.login(username, 'false password');

            expect(result?.token, null);
          });
        });
      });
    });

    group('for Products API::', () {
      group('GET', () {
        group('/products =>', () {
          setUp(() => url = '$url/products');

          test('fetching products success', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockProduct,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            final result = await client.fetchProducts();
            final matcher = [];

            for (var p in mockProduct) {
              matcher.add(Product.fromJson(p));
            }

            expect(result.map((p) => p.id).toList(),
                matcher.map((p) => p.id).toList());
            expect(result.map((p) => p.image).toList(),
                matcher.map((p) => p.image).toList());
            expect(result.map((p) => p.title).toList(),
                matcher.map((p) => p.title).toList());
            expect(result.map((p) => p.price).toList(),
                matcher.map((p) => p.price).toList());
            expect(result.map((p) => p.description).toList(),
                matcher.map((p) => p.description).toList());
            expect(result.map((p) => p.category).toList(),
                matcher.map((p) => p.category).toList());
            expect(result.map((p) => p.rating!.rate).toList(),
                matcher.map((p) => p.rating!.rate).toList());
            expect(result.map((p) => p.rating!.count).toList(),
                matcher.map((p) => p.rating!.count).toList());
          });

          test('fetching products failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 404,
              data: mockProduct,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => mockResponse);

            final result = await client.fetchProducts();
            final matcher = [];

            expect(result, matcher);
          });
        });

        group('/products/\${productId} =>', () {
          int productId = 0;
          setUp(() => url = '$url/products/$productId');

          test('fetching product by id $productId success', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockProduct[productId],
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            final result = await client.fetchProductById(productId);
            final matcher = Product.fromJson(mockProduct[productId]);

            expect(result?.id, matcher.id);
            expect(result?.image, matcher.image);
            expect(result?.title, matcher.title);
            expect(result?.price, matcher.price);
            expect(result?.description, matcher.description);
            expect(result?.category, matcher.category);
            expect(result?.rating?.rate, matcher.rating?.rate);
            expect(result?.rating?.count, matcher.rating?.count);
          });

          test('fetching product by id $productId failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 401,
              data: mockProduct[productId],
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            final result = await client.fetchProductById(productId);

            expect(result, null);
          });
        });

        group('/products/categories =>', () {
          int productId = 0;
          setUp(() => url = '$url/products/categories');

          test('fetching categories success', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockCategories,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            verify(() => mockDio.get(url)).called(1);

            final result = await client.fetchCategories();
            const matcher = mockCategories;

            expect(result, matcher);
          });

          test('fetching categories failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 401,
              data: mockProduct[productId],
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            final result = await client.fetchCategories();
            final matcher = [];

            expect(result, matcher);
          });
        });

        group('/products/category/\${category} =>', () {
          int index = 0;
          String category = mockCategories[index];
          setUp(() => url = '$url/products/category/$category');

          test('fetching products by category $category success', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockProductCategory[index],
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            final result = await client.fetchProductsByCategory(category);
            final matcher = getMockProductByCategory(index);

            expect(result.map((p) => p.id).toList(),
                matcher.map((p) => p.id).toList());
            expect(result.map((p) => p.image).toList(),
                matcher.map((p) => p.image).toList());
            expect(result.map((p) => p.title).toList(),
                matcher.map((p) => p.title).toList());
            expect(result.map((p) => p.price).toList(),
                matcher.map((p) => p.price).toList());
            expect(result.map((p) => p.description).toList(),
                matcher.map((p) => p.description).toList());
            expect(result.map((p) => p.category).toList(),
                matcher.map((p) => p.category).toList());
            expect(result.map((p) => p.rating!.rate).toList(),
                matcher.map((p) => p.rating!.rate).toList());
            expect(result.map((p) => p.rating!.count).toList(),
                matcher.map((p) => p.rating!.count).toList());
          });

          test('fetching products by category $category failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 404,
              data: mockProductCategory[index],
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => mockResponse);

            final result = await client.fetchProductsByCategory(category);
            final matcher = [];

            expect(result, matcher);
          });
        });
      });

      group('/products/\${productId} =>', () {
        int productId = 0;
        setUp(() => url = '$url/products/$productId');

        test('fetching product by id $productId success', () async {
          mockResponse = Future.value(Response(
            statusCode: 200,
            data: mockProduct[productId],
            requestOptions: RequestOptions(path: url),
          ));

          when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

          final result = await client.fetchProductById(productId);
          final matcher = Product.fromJson(mockProduct[productId]);

          expect(result?.id, matcher.id);
          expect(result?.image, matcher.image);
          expect(result?.title, matcher.title);
          expect(result?.price, matcher.price);
          expect(result?.description, matcher.description);
          expect(result?.category, matcher.category);
          expect(result?.rating?.rate, matcher.rating?.rate);
          expect(result?.rating?.count, matcher.rating?.count);
        });

        test('fetching product by id $productId failed', () async {
          mockResponse = Future.value(Response(
            statusCode: 401,
            data: mockProduct[productId],
            requestOptions: RequestOptions(path: url),
          ));

          when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

          final result = await client.fetchProductById(productId);

          expect(result, null);
        });
      });
    });

    group('for Cart API::', () {
      group('GET', () {
        group('/carts/user/\${userId} =>', () {
          int userId = 1;
          setUp(() => url = '$url/carts/user/$userId');
          var mockData = <Map<String, dynamic>>[];
          for (var mockC in mockCart) {
            if (Cart.fromJson(mockC).userId == userId) {
              mockData.add(mockC);
            }
          }

          test('fetching cart by user id $userId suceess', () async {
            mockResponse = Future.value(Response(
              statusCode: 200,
              data: mockData,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => await mockResponse);

            final result = await client.fetchCartsByUser(userId);

            var matcher = <Cart>[];
            for (var c in mockCart) {
              if (Cart.fromJson(c).userId == userId) {
                matcher.add(Cart.fromJson(c));
              }
            }

            expect(result.map((c) => c.id).toList(),
                matcher.map((c) => c.id).toList());
            expect(result.map((c) => c.userId).toList(),
                matcher.map((c) => c.userId).toList());
            expect(result.map((c) => c.date).toList(),
                matcher.map((c) => c.date).toList());
            expect(
              result
                  .map((c) => c.products!.map((cp) => cp.productId).toList())
                  .toList(),
              matcher
                  .map((c) => c.products!.map((cp) => cp.productId).toList())
                  .toList(),
            );
            expect(
              result
                  .map((c) => c.products!.map((cp) => cp.quantity).toList())
                  .toList(),
              matcher
                  .map((c) => c.products!.map((cp) => cp.quantity).toList())
                  .toList(),
            );
          });

          test('fetching cart by user id $userId failed', () async {
            mockResponse = Future.value(Response(
              statusCode: 500,
              data: mockData,
              requestOptions: RequestOptions(path: url),
            ));

            when(mockDio.get(url)).thenAnswer((_) async => mockResponse);

            final result = await client.fetchCartsByUser(userId);
            final matcher = [];

            expect(result, matcher);
          });
        });
      });
    });
  });
}

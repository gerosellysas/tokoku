import 'package:fake_store_api/fake_store_api.dart' as client;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shop_repo/shop_repo.dart';
import 'package:test/test.dart';

import 'mock_data.dart/mock.dart';
import 'shop_repo_test.mocks.dart';

@GenerateMocks([client.FakeStoreApiClient])
void main() {
  late MockFakeStoreApiClient mockShopApiClient;
  late ShopRepo shopRepo;

  setUp(() {
    mockShopApiClient = MockFakeStoreApiClient();
    shopRepo = ShopRepo(shopApiClient: mockShopApiClient);
  });

  group('constructor::', () {
    test('instantiates internal ShopRepo client when not injected', () {
      expect(ShopRepo(), isNotNull);
    });
  });

  group('test products::', () {
    group('get product categories =>', () {
      final categoriesResult = Future.value(mockCategories);

      test('categories success', () async {
        when(mockShopApiClient.fetchCategories())
            .thenAnswer((_) async => categoriesResult);

        List<String> result = [];
        try {
          result = await shopRepo.getCategories();
        } catch (_) {}

        final matcher = isA<List<String>>()
            .having((category) => category[0], 'category 0', mockCategories[0])
            .having((category) => category[1], 'category 1', mockCategories[1])
            .having((category) => category[2], 'category 2', mockCategories[2])
            .having((category) => category[3], 'category 3', mockCategories[3]);

        expect(result, matcher);
      });

      test('categories failed', () async {
        when(mockShopApiClient.fetchCategories()).thenAnswer((_) async => []);

        List<String> result = [];
        try {
          result = await shopRepo.getCategories();
        } catch (_) {}

        final matcher = [];

        expect(result, equals(matcher));
      });
    });

    group('get all products =>', () {
      List<client.Product> clientProducts = [];
      for (var p in mockProduct) {
        clientProducts.add(client.Product.fromJson(p));
      }
      final productsResult = Future.value(clientProducts);

      test('all products success', () async {
        when(mockShopApiClient.fetchProduct())
            .thenAnswer((_) async => await productsResult);

        List<Product> result = [];

        try {
          result = await shopRepo.loadProducts();
        } catch (_) {}

        List<Product> matcher = [];
        for (var p in mockProduct) {
          matcher.add(Product.fromJson(p));
        }

        expect(result, equals(matcher));
      });

      test('all products failed', () async {
        when(mockShopApiClient.fetchProduct()).thenAnswer((_) async => []);

        List<Product> result = [];

        try {
          result = await shopRepo.loadProducts();
        } catch (_) {}

        List<Product> matcher = [];

        expect(result, equals(matcher));
      });
    });

    group('get products by category =>', () {
      int index = 0;
      final category = mockCategories[index];
      List<client.Product> clientProducts = [];
      for (var p in mockProductCategory[index]) {
        clientProducts.add(client.Product.fromJson(p));
      }
      final productsResult = Future.value(clientProducts);

      test('products by category "${mockCategories[index]}" success', () async {
        when(mockShopApiClient.fetchProductByCategory(category))
            .thenAnswer((_) async => await productsResult);

        List<Product> result = [];

        try {
          result = await shopRepo.loadProductsByCategory(category);
        } catch (_) {}

        List<Product> matcher = [];
        for (var p in mockProductCategory[index]) {
          matcher.add(Product.fromJson(p));
        }

        expect(result, equals(matcher));
      });

      test('products by category "${mockCategories[index]}" failed', () async {
        when(mockShopApiClient.fetchProductByCategory(category))
            .thenAnswer((_) async => []);

        List<Product> result = [];

        try {
          result = await shopRepo.loadProductsByCategory(category);
        } catch (_) {}

        List<Product> matcher = [];

        expect(result, equals(matcher));
      });
    });

    group('find products =>', () {
      String keyword = 'men';
      List<client.Product> clientProducts = [];
      for (var p in mockProduct) {
        if (client.Product.fromJson(p)
            .title!
            .toLowerCase()
            .contains(keyword.toLowerCase())) {
          clientProducts.add(client.Product.fromJson(p));
        }
      }
      final productsResult = Future.value(clientProducts);

      test('finding products from keyword "$keyword" success', () async {
        when(mockShopApiClient.fetchProduct())
            .thenAnswer((_) async => await productsResult);

        List<Product> result = [];

        try {
          result = await shopRepo.findProducts(keyword);
        } catch (_) {}

        List<Product> matcher = [];
        for (var p in mockProduct) {
          if (Product.fromJson(p)
              .title!
              .toLowerCase()
              .contains(keyword.toLowerCase())) {
            matcher.add(Product.fromJson(p));
          }
        }

        expect(result, equals(matcher));
      });

      test('finding products from keyword "$keyword" failed', () async {
        when(mockShopApiClient.fetchProduct()).thenAnswer((_) async => []);

        List<Product> result = [];

        try {
          result = await shopRepo.findProducts(keyword);
        } catch (_) {}

        List<Product> matcher = [];

        expect(result, equals(matcher));
      });
    });

    group('load cart', () {
      int userId = 1;
      List<client.Cart> clientCarts = [];
      for (var c in mockCart) {
        if (client.Cart.fromJson(c).userId == userId) {
          clientCarts.add(client.Cart.fromJson(c));
        }
      }

      List<client.CartProducts> clientCartProducts = [];
      List<client.Product> clientProducts = [];
      var listProductId = mockProduct.map((mockCP) => mockCP['id']).toList();
      for (var c in clientCarts) {
        for (var cp in c.products!) {
          clientCartProducts.add(cp);
          var index = listProductId.indexWhere((i) => i == (cp.productId!));
          clientProducts.add(client.Product.fromJson(mockProduct[index]));
        }
      }
      List<client.Cart> clientCartsFinal = [];
      List<client.CartProducts> clientCartProductsFinal = [];
      for (var cp in clientCartProducts) {
        var index = clientCartProductsFinal
            .indexWhere((e) => e.productId == cp.productId);
        if (index != -1) {
          var totalQty =
              clientCartProductsFinal[index].quantity! + cp.quantity!;
          clientCartProductsFinal
              .removeWhere((e) => e.productId == cp.productId);
          clientCartProductsFinal.add(client.CartProducts(
            productId: cp.productId,
            quantity: totalQty,
          ));
        } else {
          clientCartProductsFinal.add(cp);
        }
      }

      for (var c in clientCarts) {
        clientCartsFinal.add(client.Cart(
          id: c.id,
          userId: c.userId,
          date: c.date,
          products: clientCartProductsFinal,
        ));
        clientCartsFinal.sort((a, b) => a.date!.compareTo(b.date!));
      }

      final productsResult = Future.value(clientProducts);

      test('cart by user id $userId sucess', () async {
        for (var c in clientCartsFinal) {
          for (var cp in c.products!) {
            print(cp.productId);
            print('//');
            print(cp.quantity);
            print('====');
          }
        }
      });
    });
  });
}

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

  group('test shop repo method::', () {
    group('get categories =>', () {
      final categoriesResult = Future.value(mockCategories);

      test('loading all categories success', () async {
        when(mockShopApiClient.fetchCategories())
            .thenAnswer((_) async => await categoriesResult);

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

      test('loading all categories failed on empty', () async {
        final answer = Future.value(<String>[]);
        when(mockShopApiClient.fetchCategories())
            .thenAnswer((_) async => await answer);

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

      test('loading all products success', () async {
        when(mockShopApiClient.fetchProducts())
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

      test('loading all products failed on products empty', () async {
        final answer = Future.value(<client.Product>[]);
        when(mockShopApiClient.fetchProducts())
            .thenAnswer((_) async => await answer);

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

      test('"${mockCategories[index]}" success', () async {
        when(mockShopApiClient.fetchProductsByCategory(category))
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

      test('"${mockCategories[index]}" failed on products empty', () async {
        final answer = Future.value(<client.Product>[]);
        when(mockShopApiClient.fetchProductsByCategory(category))
            .thenAnswer((_) async => await answer);

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

      test('from keyword "$keyword" success', () async {
        when(mockShopApiClient.fetchProducts())
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

      test('from keyword "$keyword" failed on products empty', () async {
        final answer = Future.value(<client.Product>[]);
        when(mockShopApiClient.fetchProducts())
            .thenAnswer((_) async => await answer);

        List<Product> result = [];

        try {
          result = await shopRepo.findProducts(keyword);
        } catch (_) {}

        List<Product> matcher = [];

        expect(result, equals(matcher));
      });
    });

    group('load cart =>', () {
      int userId = 1;
      List<client.Cart> clientCarts = [];
      for (var c in mockCart) {
        if (client.Cart.fromJson(c).userId == userId) {
          clientCarts.add(client.Cart.fromJson(c));
        }
      }
      final cartsResult = Future.value(clientCarts);

      List<Cart> tempCarts = [];
      List<CartProducts> cartProducts = [];
      List<Cart> carts = [];
      for (var c in mockCart) {
        if (Cart.fromJson(c).userId == userId) {
          tempCarts.add(Cart.fromJson(c));
        }
      }
      for (var c in tempCarts) {
        for (var cp in c.products!) {
          var index = cartProducts
              .indexWhere((newCP) => newCP.productId == cp.productId);
          if (index != -1) {
            var totalQty = cartProducts[index].quantity! + cp.quantity!;
            cartProducts.removeWhere((r) => r.productId == cp.productId);
            cartProducts.add(CartProducts(
              productId: cp.productId,
              quantity: totalQty,
            ));
          } else {
            cartProducts.add(cp);
          }
        }
        carts.add(Cart(
          id: c.id,
          userId: c.userId,
          date: c.date,
          products: cartProducts,
        ));
      }
      carts.sort((a, b) => a.date!.compareTo(b.date!));

      test('by user id $userId success', () async {
        when(mockShopApiClient.fetchCartsByUser(userId))
            .thenAnswer((_) async => await cartsResult);

        Cart result = const Cart();
        try {
          result = (await shopRepo.loadCartByUserId(userId));
        } catch (_) {}

        final matcher = carts.last;

        expect(result, equals(matcher));
      });

      test('by user id $userId failed on list cart empty', () async {
        final answer = Future.value(<client.Cart>[]);
        when(mockShopApiClient.fetchCartsByUser(userId))
            .thenAnswer((_) async => await answer);

        Cart result = const Cart();
        try {
          result = (await shopRepo.loadCartByUserId(userId));
        } catch (_) {}

        Cart matcher = const Cart();

        expect(result, equals(matcher));
      });

      test('by user id $userId failed on list cart null', () async {
        final answer = Future.value([client.Cart()]);
        when(mockShopApiClient.fetchCartsByUser(userId))
            .thenAnswer((_) async => await answer);

        Cart result = const Cart();
        try {
          result = (await shopRepo.loadCartByUserId(userId));
        } catch (_) {}

        Cart matcher = const Cart();

        expect(result, equals(matcher));
      });

      List<client.Product> clientProducts = [];
      for (var p in mockProduct) {
        for (var c in clientCarts) {
          for (var cp in c.products!) {
            if (cp.productId! == client.Product.fromJson(p).id) {
              clientProducts.add(client.Product.fromJson(p));
            }
          }
        }
      }
      List<client.Product> allClientProducts = [];
      for (var p in mockProduct) {
        allClientProducts.add(client.Product.fromJson(p));
      }
      final allProductsResult = Future.value(allClientProducts);

      List<Product> allProducts = [];
      List<Product> products = [];
      for (var p in mockProduct) {
        allProducts.add(Product.fromJson(p));
      }
      for (var c in carts) {
        for (var cp in c.products!) {
          var i = allProducts.indexWhere((p) => p.id == cp.productId);
          if (i != -1) {
            products.removeWhere((p) => p.id == cp.productId);
            products.add(allProducts[i]);
          } else {
            products.add(allProducts[i]);
          }
        }
      }

      test('products from cart with user id $userId success', () async {
        when(mockShopApiClient.fetchCartsByUser(userId))
            .thenAnswer((_) async => await cartsResult);

        for (var p in clientProducts) {
          var i = allClientProducts.indexWhere((clientP) => clientP.id == p.id);
          when(mockShopApiClient.fetchProductById(p.id))
              .thenAnswer((_) async => (await allProductsResult)[i]);
        }

        List<Product> result = [];
        try {
          final cartInserter = await shopRepo.loadCartByUserId(userId);
          result = await shopRepo.loadProductsFromCart(cart: cartInserter);
        } catch (_) {}

        final matcher = products;

        expect(result, equals(matcher));
      });

      test('products from cart with user id $userId failed on cart empty',
          () async {
        final answer = Future.value(<client.Cart>[]);
        when(mockShopApiClient.fetchCartsByUser(userId))
            .thenAnswer((_) async => await answer);

        List<Product> result = [];
        try {
          final cartInserter = await shopRepo.loadCartByUserId(userId);
          result = await shopRepo.loadProductsFromCart(cart: cartInserter);
        } catch (_) {}

        final matcher = [];

        expect(result, equals(matcher));
      });

      test('products from cart with user id $userId failed on cart null',
          () async {
        final answer = Future.value([client.Cart()]);
        when(mockShopApiClient.fetchCartsByUser(userId))
            .thenAnswer((_) async => await answer);

        List<Product> result = [const Product(), const Product()];

        try {
          final cartInserter = await shopRepo.loadCartByUserId(userId);
          result = await shopRepo.loadProductsFromCart(cart: cartInserter);
        } catch (_) {}

        final matcher = [];

        expect(result, equals(matcher));
      });
    });
  });
}

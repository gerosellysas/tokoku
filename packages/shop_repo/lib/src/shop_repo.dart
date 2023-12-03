import 'package:fake_store_api/fake_store_api.dart' as client;
import 'package:shop_repo/shop_repo.dart';

class ShopRepo {
  final client.FakeStoreApiClient _shopApiClient;

  ShopRepo({client.FakeStoreApiClient? shopApiClient})
      : _shopApiClient = shopApiClient ?? client.FakeStoreApiClient();

  Future<List<Product>> loadProduct() async {
    final products = await _shopApiClient.fetchProduct();
    var result = <Product>[];
    for (var p in products) {
      result.add(
        Product(
          id: p.id,
          image: p.image,
          title: p.title,
          price: p.price,
          description: p.description,
          category: p.category,
          rating: Rating(
            rate: p.rating!.rate,
            count: p.rating!.count,
          ),
        ),
      );
    }
    return result;
  }

  Future<List<Product>> findProduct(String keyword) async {
    var products = await _shopApiClient.fetchProduct();
    var results = <Product>[];
    var temps = <client.Product>[];
    await Future.forEach(products, (p) async {
      if (p.title!.toLowerCase().contains(keyword.toLowerCase())) {
        temps.add(p);
      }
    });
    for (var temp in temps) {
      results.add(
        Product(
          id: temp.id,
          image: temp.image,
          title: temp.title,
          price: temp.price,
          description: temp.description,
          category: temp.category,
          rating: Rating(
            rate: temp.rating?.rate,
            count: temp.rating?.count,
          ),
        ),
      );
    }
    return results;
  }

  Future<List<Cart>> loadCart() async {
    final carts = await _shopApiClient.fetchCart();
    var results = <Cart>[];
    var cartProducts = <CartProducts>[];
    await Future.forEach(carts, (c) {
      for (var cp in c.products!) {
        cartProducts
            .add(CartProducts(productId: cp.productId, quantity: cp.quantity));
      }
    });
    for (var c in carts) {
      results.add(
        Cart(
          id: c.id,
          userId: c.userId,
          date: c.date,
          products: cartProducts,
        ),
      );
    }
    return results;
  }
}

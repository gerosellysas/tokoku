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
    var result = <Product>[];
    var temp = <client.Product>[];
    await Future.forEach(products, (p) async {
      if (p.title!.toLowerCase().contains(keyword.toLowerCase())) {
        temp.add(p);
      }
    });

    for (var tempP in temp) {
      result.add(
        Product(
          id: tempP.id,
          image: tempP.image,
          title: tempP.title,
          price: tempP.price,
          description: tempP.description,
          category: tempP.category,
          rating: Rating(
            rate: tempP.rating?.rate,
            count: tempP.rating?.count,
          ),
        ),
      );
    }
    return result;
  }

  Future<List<Cart>> loadCart() async {
    final carts = await _shopApiClient.fetchCart();
    var result = <Cart>[];
    var cartP = <CartProducts>[];
    await Future.forEach(carts, (cart) {
      for (var cp in cart.products!) {
        cartP.add(CartProducts(productId: cp.productId, quantity: cp.quantity));
      }
    });
    for (var c in carts) {
      result.add(
        Cart(
          id: c.id,
          userId: c.userId,
          date: c.date,
          products: cartP,
        ),
      );
    }
    return result;
  }
}

import 'package:fake_store_api/fake_store_api.dart'
    hide Product, Rating, Cart, CartProducts;
import 'package:shop_repo/shop_repo.dart';

class ShopRepo {
  final FakeStoreApiClient _shopApiClient;

  ShopRepo({FakeStoreApiClient? shopApiClient})
      : _shopApiClient = shopApiClient ?? FakeStoreApiClient();

  Future<List<String>> getCategories() async =>
      await _shopApiClient.fetchCategories();

  Future<List<Product>> loadProducts() async {
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

  Future<List<Product>> loadProductsByCategory(String category) async {
    final products = await _shopApiClient.fetchProductByCategory(category);
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

  Future<List<Product>> findProducts(String keyword) async {
    final products = await _shopApiClient.fetchProduct();
    var result = <Product>[];
    await Future.forEach(products, (p) async {
      if (p.title!.toLowerCase().contains(keyword.toLowerCase())) {
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
    });
    return result;
  }

  Future<Product> loadProductById(int productId) async {
    final product = await _shopApiClient.fetchProductById(productId);
    return Product(
      id: product?.id,
      image: product?.image,
      title: product?.title,
      price: product?.price,
      description: product?.description,
      category: product?.category,
      rating: Rating(
        rate: product?.rating!.rate,
        count: product?.rating!.count,
      ),
    );
  }

  Future<Cart> loadCartByUserId(int userId) async {
    final cart = await _shopApiClient.fetchCartByUser(userId);
    var cartProducts = <CartProducts>[];
    await Future.forEach(cart!.products!, (cp) {
      cartProducts
          .add(CartProducts(productId: cp.productId, quantity: cp.quantity));
    });
    return Cart(
      id: cart.id,
      userId: cart.userId,
      date: cart.date,
      products: cartProducts,
    );
  }
}

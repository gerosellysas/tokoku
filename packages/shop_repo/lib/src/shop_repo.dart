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
    final products = await _shopApiClient.fetchProducts();
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
    final products = await _shopApiClient.fetchProductsByCategory(category);
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
            rate: p.rating?.rate,
            count: p.rating?.count,
          ),
        ),
      );
    }
    return result;
  }

  Future<List<Product>> findProducts(String keyword) async {
    final products = await _shopApiClient.fetchProducts();
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
    if (product == null) return const Product();
    return Product(
      id: product.id,
      image: product.image,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      rating: Rating(
        rate: product.rating!.rate,
        count: product.rating!.count,
      ),
    );
  }

  Future<Cart> loadCartByUserId(int userId) async {
    final carts = await _shopApiClient.fetchCartsByUser(userId);
    if (carts.isEmpty) return const Cart();
    if (carts.any((c) =>
        c.id == null ||
        c.userId == null ||
        c.date == null ||
        c.products == null ||
        c.products!.isEmpty)) return const Cart();
    var result = <Cart>[];
    var tempCartProducts = <CartProducts>[];
    await Future.forEach(carts, (c) async {
      for (var cp in c.products!) {
        tempCartProducts.add(CartProducts(
          productId: cp.productId,
          quantity: cp.quantity,
        ));
      }
    });
    if (tempCartProducts.isEmpty) return const Cart();
    final newCartProducts =
        await _calculateCartProductsQty(cartProducts: tempCartProducts);
    for (var c in carts) {
      result.add(Cart(
        id: c.id,
        userId: c.userId,
        date: c.date,
        products: newCartProducts,
      ));
    }
    result.sort((a, b) => a.date!.compareTo(b.date!));
    return result.last;
  }

  Future<List<Product>> loadProductsFromCart({Cart? cart}) async {
    var result = <Product>[];
    if (cart == null || cart == const Cart()) return result;
    for (var cp in cart.products!) {
      result.add((await loadProductById(cp.productId!)));
    }
    return result;
  }

  Future<List<CartProducts>> _calculateCartProductsQty(
      {required List<CartProducts>? cartProducts}) async {
    var result = <CartProducts>[];
    if (cartProducts == null || cartProducts.isEmpty) return result;
    for (var cp in cartProducts) {
      var index = result.indexWhere((r) => r.productId == cp.productId);
      if (index != -1) {
        var totalQty = result[index].quantity! + cp.quantity!;
        result.removeWhere((r) => r.productId == cp.productId);
        result.add(CartProducts(
          productId: cp.productId,
          quantity: totalQty,
        ));
      } else {
        result.add(cp);
      }
    }
    return result;
  }
}

import 'package:fake_store_api/fake_store_api.dart' as c;
import 'package:shop_repo/shop_repo.dart';

class ShopRepo {
  final c.FakeStoreApiClient _shopApiClient;

  ShopRepo({c.FakeStoreApiClient? shopApiClient})
      : _shopApiClient = shopApiClient ?? c.FakeStoreApiClient();

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
    var temp = <c.Product>[];
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
}

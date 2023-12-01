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
      result.add(Product(
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
      ));
    }
    return result;
  }
}

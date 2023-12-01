import 'package:fake_store_api/fake_store_api.dart';

class ShopRepo {
  final FakeStoreApiClient _shopApiClient;

  ShopRepo({FakeStoreApiClient? shopApiClient})
      : _shopApiClient = shopApiClient ?? FakeStoreApiClient();

  Future<List<Product>> loadProduct() async {
    return await _shopApiClient.fetchProduct();
  }
}

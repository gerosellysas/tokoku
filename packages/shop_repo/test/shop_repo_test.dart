import 'package:fake_store_api/fake_store_api.dart' as client;
import 'package:mockito/annotations.dart';
import 'package:shop_repo/shop_repo.dart';
import 'package:test/scaffolding.dart';

import 'shop_repo_test.mocks.dart';

@GenerateMocks([client.FakeStoreApiClient])
void main() {
  late MockFakeStoreApiClient mockUserApiClient;
  late ShopRepo shopRepo;
  late Cart mockCart;

  setUp(() {
    mockUserApiClient = MockFakeStoreApiClient();
    shopRepo = ShopRepo(shopApiClient: MockFakeStoreApiClient());
    // mockCart
  });
}

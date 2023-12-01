import 'package:auth_repo/auth_repo.dart';
import 'package:fake_store_api/fake_store_api.dart' as client;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'auth_repo_test.mocks.dart';

@GenerateMocks([client.FakeStoreApiClient])
void main() {
  late MockFakeStoreApiClient mockUserApiClient;
  late AuthRepo authRepo;
  late User mockUser;
  late String mockToken;

  setUp(() {
    mockUserApiClient = MockFakeStoreApiClient();
    authRepo = AuthRepo(userApiClient: mockUserApiClient);
    mockUser = const User(id: 1, username: 'johnd', password: 'm38rmF\$');
    mockToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXIiOiJtb3JfMjMxNCIsImlhdCI6MTcwMTM1NjkwMn0.BVOaMTXf7lBQGdfvrCBAiCR5t8NBGIfxrtGy4oz8ZPg';
  });

  group('constructor', () {
    test('instantiates internal user api client when not injected', () {
      expect(AuthRepo(), isNotNull);
    });
  });

  group('get user', () {
    test('call fetchUser with User return', () async {
      var user = Future.value([
        client.User(
          id: mockUser.id,
          username: mockUser.username,
          password: mockUser.password,
        ),
      ]);

      var token = Future.value(mockToken);

      when(mockUserApiClient.fetchUser()).thenAnswer((_) => user);

      when(mockUserApiClient.postUser(mockUser.username!, mockUser.password!))
          .thenAnswer((_) => token);

      User result = const User();
      try {
        result = await authRepo.login(mockUser.username!, mockUser.password!);
      } catch (_) {}

      expect(
          result,
          equals(User(
            id: mockUser.id,
            username: mockUser.username,
            password: mockUser.password,
            token: mockToken,
          )));
    });

    test('call fetchUser with null return', () async {
      var user = Future.value([
        client.User(
          id: mockUser.id,
          username: 'no name',
          password: 'wrong password',
        ),
      ]);

      when(mockUserApiClient.fetchUser()).thenAnswer((_) => user);

      User result = const User();
      try {
        result = await authRepo.login(mockUser.username!, mockUser.password!);
      } catch (_) {}

      expect(result, const User());
    });
  });
}

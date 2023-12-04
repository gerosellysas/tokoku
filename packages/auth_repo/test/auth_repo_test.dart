import 'package:auth_repo/auth_repo.dart';
import 'package:fake_store_api/fake_store_api.dart' as client;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'auth_repo_test.mocks.dart';
import 'mock_data/mock.dart';

@GenerateMocks([client.FakeStoreApiClient])
void main() {
  late MockFakeStoreApiClient mockUserApiClient;
  late AuthRepo authRepo;

  setUp(() {
    mockUserApiClient = MockFakeStoreApiClient();
    authRepo = AuthRepo(userApiClient: mockUserApiClient);
  });

  group('constructor::', () {
    test('instantiates internal AuthRepo client when not injected', () {
      expect(AuthRepo(), isNotNull);
    });
  });

  group('test login user::', () {
    int index = 0;
    List<client.User> clientUsers = [];
    for (var u in mockUser) {
      clientUsers.add(client.User.fromJson(u));
    }
    final usersResult = Future.value(clientUsers);
    client.Token clientToken = client.Token.fromJson(mockToken);
    final tokenResult = Future.value(clientToken);

    final user = User.fromJson(mockUser[index]);
    final token = Token.fromJson(mockToken);

    test('get token success', () async {
      when(mockUserApiClient.fetchUsers())
          .thenAnswer((_) async => await usersResult);

      when(mockUserApiClient.login(user.username!, user.password!))
          .thenAnswer((_) async => await tokenResult);

      User result = const User();
      try {
        result = await authRepo.login(
          username: user.username!,
          password: user.password!,
        );
      } catch (_) {}

      final matcher = User(
        id: user.id,
        username: user.username,
        password: user.password,
        name: Name(
          firstname: user.name!.firstname,
          lastname: user.name!.lastname,
        ),
        email: user.email,
        phone: user.phone,
        address: Address(
          street: user.address!.street,
          number: user.address!.number,
          city: user.address!.city,
          zipcode: user.address!.zipcode,
          geolocation: Geolocation(
            lat: user.address!.geolocation!.lat,
            long: user.address!.geolocation!.long,
          ),
        ),
        token: Token(token: token.token),
      );

      expect(result, equals(matcher));
    });

    test('wrong username', () async {
      when(await mockUserApiClient.fetchUsers()).thenAnswer((_) => clientUsers);

      User result = const User();
      try {
        result = await authRepo.login(
          username: 'wrong username',
          password: user.password!,
        );
      } catch (_) {}

      const matcher = User();

      expect(result, equals(matcher));
    });

    test('wrong password', () async {
      when(await mockUserApiClient.fetchUsers()).thenAnswer((_) => clientUsers);

      User result = const User();
      try {
        result = await authRepo.login(
          username: user.username!,
          password: 'wrong password',
        );
      } catch (_) {}

      const matcher = User();

      expect(result, equals(matcher));
    });
  });
}

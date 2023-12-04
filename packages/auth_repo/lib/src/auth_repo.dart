import 'dart:async';

import 'package:auth_repo/src/models/models.dart';
import 'package:fake_store_api/fake_store_api.dart'
    hide User, Name, Address, Geolocation, Token;

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepo {
  final FakeStoreApiClient _userApiClient;
  final _controller = StreamController<AuthStatus>();
  User user = const User();

  AuthRepo({FakeStoreApiClient? userApiClient})
      : _userApiClient = userApiClient ?? FakeStoreApiClient();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<User> login(
      {required String username, required String password}) async {
    final users = await _userApiClient.fetchUsers();
    final index = users
        .indexWhere((u) => u.username == username && u.password == password);
    if (index == -1) {
      _controller.add(AuthStatus.unauthenticated);
      return user = const User();
    }
    var u = users[index];
    final token = await _userApiClient.login(username, password);
    if (token == null) {
      _controller.add(AuthStatus.unauthenticated);
      return user = const User();
    }
    _controller.add(AuthStatus.authenticated);
    return user = User(
      id: u.id,
      username: u.username,
      password: u.password,
      name: Name(
        firstname: u.name!.firstname,
        lastname: u.name!.lastname,
      ),
      email: u.email,
      phone: u.phone,
      address: Address(
        street: u.address!.street,
        number: u.address!.number,
        city: u.address!.city,
        zipcode: u.address!.zipcode,
        geolocation: Geolocation(
          lat: u.address!.geolocation!.lat,
          long: u.address!.geolocation!.long,
        ),
      ),
      token: Token(token: token.token),
    );
  }

  void logout() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

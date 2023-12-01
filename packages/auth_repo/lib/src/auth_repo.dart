import 'dart:async';

import 'package:auth_repo/src/models/models.dart';
import 'package:fake_store_api/fake_store_api.dart' hide User;

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepo {
  final FakeStoreApiClient _userApiClient;
  final _controller = StreamController<AuthStatus>();
  User? user = const User();

  AuthRepo({FakeStoreApiClient? userApiClient})
      : _userApiClient = userApiClient ?? FakeStoreApiClient();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<User> login(String username, String password) async {
    final users = await _userApiClient.fetchUser();
    final index = users
        .indexWhere((u) => u.username == username && u.password == password);
    if (index == -1) {
      _controller.add(AuthStatus.unauthenticated);
      return user = const User();
    }
    var token = await _userApiClient.postUser(
      users[index].username!,
      users[index].password!,
    );
    _controller.add(AuthStatus.authenticated);
    return user = User(
      id: users[index].id,
      username: users[index].username,
      password: users[index].password,
      token: token,
    );
  }

  void logout() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

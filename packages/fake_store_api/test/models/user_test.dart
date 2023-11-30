import 'package:fake_store_api/fake_store_api.dart';
import 'package:test/test.dart';

import '../mock_user.dart';

void main() {
  group('User', () {
    group('fromJson', () {
      test('returns correct User object', () {
        expect(
          User.fromJson(mockUser[0]),
          isA<User>()
              .having((u) => u.id, 'id', 1)
              .having((u) => u.username, 'username', 'johnd')
              .having((u) => u.password, 'password', 'm38rmF\$'),
        );
      });
    });
  });
}

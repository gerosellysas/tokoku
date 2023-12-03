import 'package:fake_store_api/fake_store_api.dart';
import 'package:test/test.dart';

import '../mock_data/mock.dart';

void main() {
  group('Token', () {
    group('fromJson', () {
      test('returns correct Token object', () {
        expect(
          Token.fromJson(mockToken),
          isA<Token>().having((t) => t.token, 'token',
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXIiOiJtb3JfMjMxNCIsImlhdCI6MTcwMTU4MDY1NH0.wGUK_BydZKeD7g7XJFIyry2cDF46vEQYXQ63eGZz5aw'),
        );
      });
    });
  });
}

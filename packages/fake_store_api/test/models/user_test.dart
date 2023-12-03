import 'package:fake_store_api/fake_store_api.dart';
import 'package:test/test.dart';

import '../mock_data/mock.dart';

void main() {
  group('User', () {
    group('fromJson', () {
      test('returns correct User object', () {
        expect(
          User.fromJson(mockUser[0]),
          isA<User>()
              .having((u) => u.id, 'id', 1)
              .having((u) => u.username, 'username', 'johnd')
              .having((u) => u.password, 'password', 'm38rmF\$')
              .having((u) => u.name?.firstname, 'email', 'john')
              .having((u) => u.name?.lastname, 'email', 'doe')
              .having((u) => u.email, 'email', 'john@gmail.com')
              .having((u) => u.phone, 'phone', '1-570-236-7033')
              .having((u) => u.address?.street, 'street', 'new road')
              .having((u) => u.address?.city, 'city', 'kilcoole')
              .having((u) => u.address?.number, 'number', 7682)
              .having((u) => u.address?.zipcode, 'zipcode', '12926-3874')
              .having((u) => u.address?.geolocation?.lat, 'lat', '-37.3159')
              .having((u) => u.address?.geolocation?.long, 'long', '81.1496'),
        );
      });

      test('returns correct Address object', () {
        expect(
          Address.fromJson((mockUser[0]['address'] as Map<String, dynamic>)),
          isA<Address>()
              .having((a) => a.street, 'street', 'new road')
              .having((a) => a.city, 'city', 'kilcoole')
              .having((a) => a.number, 'number', 7682)
              .having((a) => a.zipcode, 'zipcode', '12926-3874')
              .having((a) => a.geolocation?.lat, 'lat', '-37.3159')
              .having((a) => a.geolocation?.long, 'long', '81.1496'),
        );
      });

      test('returns correct Geolocation object', () {
        expect(
          Geolocation.fromJson(
              (mockUser[0]['address']['geolocation'] as Map<String, dynamic>)),
          isA<Geolocation>()
              .having((g) => g.lat, 'lat', '-37.3159')
              .having((g) => g.long, 'long', '81.1496'),
        );
      });
    });
  });
}

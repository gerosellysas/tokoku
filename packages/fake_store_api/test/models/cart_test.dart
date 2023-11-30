import 'package:fake_store_api/fake_store_api.dart';
import 'package:test/test.dart';

import '../mock_cart.dart';

void main() {
  group('Cart', () {
    group('fromJson', () {
      test('returns correct Cart object', () {
        expect(
          Cart.fromJson(mockCart[0]),
          isA<Cart>()
              .having((c) => c.id, 'id', 1)
              .having((c) => c.userId, 'userId', 1)
              .having((c) => c.date!.toIso8601String(), 'date',
                  '2020-03-02T00:00:00.000Z')
              .having((c) => c.products!.map((e) => e.productId).toList(),
                  'productId', [
            1,
            2,
            3
          ]).having((c) => c.products!.map((e) => e.quantity).toList(),
                  'quantity', [4, 1, 6]),
        );
      });

      test('returns correct Cart Products object', () {
        expect(
          CartProducts.fromJson(
              (mockCart[0]['products'] as List<Map<String, int>>)[0]),
          isA<CartProducts>()
              .having((cp) => cp.productId, 'productId', 1)
              .having((cp) => cp.quantity, 'quantity', 4),
        );
      });
    });
  });
}

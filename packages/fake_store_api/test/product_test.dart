import 'package:fake_store_api/fake_store_api.dart';
import 'package:test/test.dart';

import 'mock_product.dart';

void main() {
  group('Product', () {
    group('fromJson', () {
      test('returns correct Product object', () {
        expect(
          Product.fromJson(mockProduct[0]),
          isA<Product>()
              .having((p) => p.id, 'id', 1)
              .having((p) => p.title, 'title',
                  'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops')
              .having((p) => p.price, 'price', 109.95)
              .having((p) => p.description, 'description',
                  'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday')
              .having((p) => p.category, 'category', 'men\'s clothing')
              .having((p) => p.image, 'image',
                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg')
              .having((p) => p.rating!.rate, 'rate', 3.9)
              .having((p) => p.rating!.count, 'rate', 120),
        );
      });

      test('returns correct Rating object', () {
        expect(
          Rating.fromJson(mockProduct[0]['rating'] as Map<String, dynamic>),
          isA<Rating>()
              .having((r) => r.rate, 'rate', 3.9)
              .having((r) => r.count, 'count', 120),
        );
      });
    });
  });
}

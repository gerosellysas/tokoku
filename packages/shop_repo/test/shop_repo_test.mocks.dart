// Mocks generated by Mockito 5.4.3 from annotations
// in shop_repo/test/shop_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fake_store_api/src/fake_store_api_client.dart' as _i2;
import 'package:fake_store_api/src/models/models.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FakeStoreApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeStoreApiClient extends _i1.Mock
    implements _i2.FakeStoreApiClient {
  MockFakeStoreApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.User>> fetchUser() => (super.noSuchMethod(
        Invocation.method(
          #fetchUser,
          [],
        ),
        returnValue: _i3.Future<List<_i4.User>>.value(<_i4.User>[]),
      ) as _i3.Future<List<_i4.User>>);

  @override
  _i3.Future<_i4.Token?> login(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            username,
            password,
          ],
        ),
        returnValue: _i3.Future<_i4.Token?>.value(),
      ) as _i3.Future<_i4.Token?>);

  @override
  _i3.Future<List<_i4.Product>> fetchProduct() => (super.noSuchMethod(
        Invocation.method(
          #fetchProduct,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Product>>.value(<_i4.Product>[]),
      ) as _i3.Future<List<_i4.Product>>);

  @override
  _i3.Future<_i4.Product?> fetchProductById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchProductById,
          [id],
        ),
        returnValue: _i3.Future<_i4.Product?>.value(),
      ) as _i3.Future<_i4.Product?>);

  @override
  _i3.Future<List<String>> fetchCategories() => (super.noSuchMethod(
        Invocation.method(
          #fetchCategories,
          [],
        ),
        returnValue: _i3.Future<List<String>>.value(<String>[]),
      ) as _i3.Future<List<String>>);

  @override
  _i3.Future<List<_i4.Product>> fetchProductByCategory(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchProductByCategory,
          [category],
        ),
        returnValue: _i3.Future<List<_i4.Product>>.value(<_i4.Product>[]),
      ) as _i3.Future<List<_i4.Product>>);

  @override
  _i3.Future<_i4.Cart?> fetchCartByUser(int? userId) => (super.noSuchMethod(
        Invocation.method(
          #fetchCartByUser,
          [userId],
        ),
        returnValue: _i3.Future<_i4.Cart?>.value(),
      ) as _i3.Future<_i4.Cart?>);
}

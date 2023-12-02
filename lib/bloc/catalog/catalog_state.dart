part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object> get props => [];
}

final class CatalogLoading extends CatalogState {}

final class CatalogLoaded extends CatalogState {
  final List<Product> catalog;
  final List<String> categories;

  const CatalogLoaded(this.catalog, this.categories);

  @override
  List<Object> get props => [catalog];
}

final class CatalogError extends CatalogState {}

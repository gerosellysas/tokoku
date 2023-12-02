part of 'catalog_bloc.dart';

sealed class CatalogEvent extends Equatable {
 final  String? categoryName;
  const CatalogEvent(this.categoryName);
}

final class CatalogStarted extends CatalogEvent {
  const CatalogStarted(super.categoryName);

  @override
  List<Object> get props => [];
}

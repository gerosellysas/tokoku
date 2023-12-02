import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_repo/shop_repo.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ShopRepo shopRepo;

  CatalogBloc({required this.shopRepo}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  Future<void> _onStarted(
    CatalogStarted event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final catalog = await shopRepo.loadProduct();
      final categories = <String>[];
      for (var cat in catalog) {
        var valid =
            categories.any((category) => category.contains(cat.category!));
        if (!valid) {
          categories.add(cat.category!);
        }
      }

      switch (event.categoryName) {
        case '' || null || 'All':
          emit(CatalogLoaded(catalog, categories));
          break;
        case 'men\'s clothing':
          var temCatalog = <Product>[];
          for (var res in catalog) {
            if (res.category == event.categoryName) {
              temCatalog.add(res);
            }
          }
          emit(CatalogLoaded(temCatalog, categories));
          break;
        case 'jewelery':
          var temCatalog = <Product>[];
          for (var res in catalog) {
            if (res.category == event.categoryName) {
              temCatalog.add(res);
            }
          }
          emit(CatalogLoaded(temCatalog, categories));
          break;
        case 'electronics':
          var temCatalog = <Product>[];
          for (var res in catalog) {
            if (res.category == event.categoryName) {
              temCatalog.add(res);
            }
          }
          emit(CatalogLoaded(temCatalog, categories));
          break;
        case 'women\'s clothing':
          var temCatalog = <Product>[];
          for (var res in catalog) {
            if (res.category == event.categoryName) {
              temCatalog.add(res);
            }
          }
          emit(CatalogLoaded(temCatalog, categories));
          break;
        default:
      }
    } catch (_) {
      emit(CatalogError());
    }
  }
}

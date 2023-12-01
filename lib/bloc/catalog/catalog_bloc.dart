import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_repo/shop_repo.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.shopRepo}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  final ShopRepo shopRepo;

  Future<void> _onStarted(
    CatalogStarted event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final catalog = await shopRepo.loadProduct();
      emit(CatalogLoaded(catalog));
    } catch (_) {
      emit(CatalogError());
    }
  }
}

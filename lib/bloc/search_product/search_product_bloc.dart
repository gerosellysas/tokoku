import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shop_repo/shop_repo.dart';
import 'package:tokoku/models/models.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final ShopRepo _shopRepo;

  SearchProductBloc({required ShopRepo shopRepo})
      : _shopRepo = shopRepo,
        super(const SearchProductState()) {
    on<SearchKeywordChanged>(_onSearchKeywordChanged);
    on<SearchProductSubmitted>(_onSubmitted);
  }

  void _onInit() {}

  void _onSearchKeywordChanged(
    SearchKeywordChanged event,
    Emitter<SearchProductState> emit,
  ) {
    final keyword = SearchKeyword.dirty(event.keyword);
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.initial,
        keyword: keyword,
        isValid: Formz.validate([keyword]),
        products: [],
      ),
    );
  }

  Future<void> _onSubmitted(
    SearchProductSubmitted event,
    Emitter<SearchProductState> emit,
  ) async {
    print('0 =====> ${state.status}');
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
    print('00 =====> ${state.status}');
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        List<Product> products =
            (await _shopRepo.findProduct(state.keyword.value));

        if (products.isEmpty) {
          print('11 =====> $products');
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
          print('11 =====> ${state.status}');
          return;
        }
        print('2=====> $products');
        emit(state.copyWith(
            status: FormzSubmissionStatus.success, products: products));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}

// Future<void> _onStarted(
//   SearchProductEvent event,
//   Emitter<SearchProductState> emit,
// ) async {
//   emit(SearchProductLoading());
//   try {
//     Product? product = await _shopRepo.findProduct(state.keyword.value);
//     emit(SearchProductLoaded(product));
//   } catch (_) {
//     emit(SearchProductError());
//   }
// }

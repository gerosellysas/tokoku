part of 'search_product_bloc.dart';

sealed class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

final class SearchKeywordChanged extends SearchProductEvent {
  final String keyword;

  const SearchKeywordChanged(this.keyword);

  @override
  List<Object> get props => [keyword];
}

final class SearchProductSubmitted extends SearchProductEvent {
  const SearchProductSubmitted();
}

final class SearchProductInit extends SearchProductEvent {
  final FormzSubmissionStatus status;
  final SearchKeyword keyword;
  final bool isValid;
  final List<Product> products;

  const SearchProductInit({
    this.status = FormzSubmissionStatus.initial,
    this.keyword = const SearchKeyword.pure(),
    this.isValid = false,
    this.products = const <Product>[],
  });

  SearchProductState copyWith({
    FormzSubmissionStatus? status,
    SearchKeyword? keyword,
    bool? isValid,
    List<Product>? products,
  }) {
    return SearchProductState(
      status: status ?? this.status,
      keyword: keyword ?? this.keyword,
      isValid: isValid ?? this.isValid,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [status, keyword, products, isValid];
}

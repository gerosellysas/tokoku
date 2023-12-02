part of 'search_product_bloc.dart';

final class SearchProductState extends Equatable {
  final FormzSubmissionStatus status;
  final SearchKeyword keyword;
  final bool isValid;
  final List<Product> products;

  const SearchProductState({
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
  List<Object> get props => [status, keyword, products];
}

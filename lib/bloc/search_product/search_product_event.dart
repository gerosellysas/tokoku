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

final class SearchProductStarted extends SearchProductEvent {
  @override
  List<Object> get props => [];
}

import 'package:formz/formz.dart';

enum SearchKeywordValidationError { empty }

class SearchKeyword extends FormzInput<String, SearchKeywordValidationError> {
  const SearchKeyword.pure() : super.pure('');
  const SearchKeyword.dirty([super.value = '']) : super.dirty();

  @override
  SearchKeywordValidationError? validator(String value) {
    if (value.isEmpty) return SearchKeywordValidationError.empty;
    return null;
  }
}

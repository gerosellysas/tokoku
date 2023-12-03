import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';


@JsonSerializable()
class Token {
  final String? token;

  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);

  Token({
    this.token,
  });
}

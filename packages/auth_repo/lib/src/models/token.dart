import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends Equatable {
  final String? token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  const Token({
    this.token,
  });

  @override
  List<Object?> get props => [token];
}

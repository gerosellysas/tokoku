import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String? username;
  final String? password;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  const User({this.id, this.username, this.password, this.token});

  @override
  List<Object?> get props => [id, username, password, token];

  static const empty = User();
}

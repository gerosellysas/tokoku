import 'package:auth_repo/src/models/token.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final Address? address;
  final String? phone;
  final Token? token;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
    this.token,
  });

  @override
  List<Object?> get props =>
      [id, email, username, password, name, address, phone, token];
}

@JsonSerializable()
class Name extends Equatable {
  final String? firstname;
  final String? lastname;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  const Name({
    this.firstname,
    this.lastname,
  });

  @override
  List<Object?> get props => [firstname, lastname];
}

@JsonSerializable()
class Address extends Equatable {
  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  const Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  @override
  List<Object?> get props => [geolocation, city, street, number, zipcode];
}

@JsonSerializable()
class Geolocation extends Equatable {
  final String? lat;
  final String? long;

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);

  const Geolocation({
    this.lat,
    this.long,
  });

  @override
  List<Object?> get props => [lat, long];
}

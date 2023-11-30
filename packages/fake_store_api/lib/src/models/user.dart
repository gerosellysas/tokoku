import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? username;
  final String? password;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({required this.id, required this.username, required this.password});
}

// @JsonSerializable()
// class User {
//   final int? id;
//   final String? email;
//   final String? username;
//   final String? password;
//   final Name? name;
//   final Address? address;
//   final String? phone;
//   final int? v;

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   User({
//     this.id,
//     this.email,
//     this.username,
//     this.password,
//     this.name,
//     this.address,
//     this.phone,
//     this.v,
//   });
// }

// @JsonSerializable()
// class Name {
//   final String? firstname;
//   final String? lastname;

//   factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

//   Name({
//     this.firstname,
//     this.lastname,
//   });
// }

// @JsonSerializable()
// class Address {
//   final Geolocation? geolocation;
//   final String? city;
//   final String? street;
//   final int? number;
//   final String? zipcode;

//   factory Address.fromJson(Map<String, dynamic> json) =>
//       _$AddressFromJson(json);

//   Address({
//     this.geolocation,
//     this.city,
//     this.street,
//     this.number,
//     this.zipcode,
//   });
// }

// @JsonSerializable()
// class Geolocation {
//   final String? lat;
//   final String? long;

//   factory Geolocation.fromJson(Map<String, dynamic> json) =>
//       _$GeolocationFromJson(json);

//   Geolocation({
//     this.lat,
//     this.long,
//   });
// }

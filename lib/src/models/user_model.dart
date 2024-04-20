import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String email, firstName, lastName, avatar;
  final int id;
  User(
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.email,
  );
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "username")
  String? name;
  String? email;
  String? celular;
  String? cpf;
  String? senha;
  String? id;
  String? token;

  UserModel(
      {this.name,
      this.email,
      this.cpf,
      this.celular,
      this.senha,
      this.id,
      this.token});

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     name: map['username'],
  //     email: map['email'],
  //     celular: map['phone'],
  //     cpf: map['cpf'],
  //     id: map['objectId'],
  //     token: map['token'],
  //   );
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'username': name,
  //     "email": email,
  //     "phone": celular,
  //     "cpf": cpf,
  //     "objectId": id,
  //     "token": token
  //   };
  // }
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

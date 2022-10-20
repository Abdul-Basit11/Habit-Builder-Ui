// To parse this JSON data, do
//
//     final habitUserModel = habitUserModelFromJson(jsonString);

import 'dart:convert';

HabitUserModel habitUserModelFromJson(String str) =>
    HabitUserModel.fromJson(json.decode(str));

String habitUserModelToJson(HabitUserModel data) => json.encode(data.toJson());

class HabitUserModel {
  HabitUserModel({
    required this.uid,
    required this.email,
    required this.password,
  });

  String uid;
  String email;
  String password;

  factory HabitUserModel.fromJson(Map<String, dynamic> json) => HabitUserModel(
        uid: json["uid"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
      };
}

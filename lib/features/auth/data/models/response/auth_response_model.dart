import 'dart:convert';

class AuthResponseModel {
  final String message;
  final String device;
  final String accessToken;

  AuthResponseModel({
    required this.message,
    required this.device,
    required this.accessToken,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        device: json["device"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "device": device,
        "accessToken": accessToken,
      };
}

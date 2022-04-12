// To parse this JSON data, do
//
//     final postUserMidd = postUserMiddFromJson(jsonString);

import 'dart:convert';

PostUserMidd postUserMiddFromJson(String str) =>
    PostUserMidd.fromJson(json.decode(str));

String postUserMiddToJson(PostUserMidd data) => json.encode(data.toJson());

class PostUserMidd {
  PostUserMidd({
    required this.name,
    required this.picture,
    required this.iss,
    required this.aud,
    required this.authTime,
    required this.userId,
    required this.sub,
    required this.iat,
    required this.exp,
    required this.email,
    required this.emailVerified,
    required this.firebase,
    required this.uid,
  });

  String name;
  String picture;
  String iss;
  String aud;
  int authTime;
  String userId;
  String sub;
  int iat;
  int exp;
  String email;
  bool emailVerified;
  Firebase firebase;
  String uid;

  factory PostUserMidd.fromJson(Map<String, dynamic> json) => PostUserMidd(
        name: json["name"],
        picture: json["picture"],
        iss: json["iss"],
        aud: json["aud"],
        authTime: json["auth_time"],
        userId: json["user_id"],
        sub: json["sub"],
        iat: json["iat"],
        exp: json["exp"],
        email: json["email"],
        emailVerified: json["email_verified"],
        firebase: Firebase.fromJson(json["firebase"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "picture": picture,
        "iss": iss,
        "aud": aud,
        "auth_time": authTime,
        "user_id": userId,
        "sub": sub,
        "iat": iat,
        "exp": exp,
        "email": email,
        "email_verified": emailVerified,
        "firebase": firebase.toJson(),
        "uid": uid,
      };
}

class Firebase {
  Firebase({
    required this.identities,
    required this.signInProvider,
  });

  Identities identities;
  String signInProvider;

  factory Firebase.fromJson(Map<String, dynamic> json) => Firebase(
        identities: Identities.fromJson(json["identities"]),
        signInProvider: json["sign_in_provider"],
      );

  Map<String, dynamic> toJson() => {
        "identities": identities.toJson(),
        "sign_in_provider": signInProvider,
      };
}

class Identities {
  Identities({
    required this.googleCom,
    required this.email,
  });

  List<String> googleCom;
  List<String> email;

  factory Identities.fromJson(Map<String, dynamic> json) => Identities(
        googleCom: List<String>.from(json["google.com"].map((x) => x)),
        email: List<String>.from(json["email"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "google.com": List<dynamic>.from(googleCom.map((x) => x)),
        "email": List<dynamic>.from(email.map((x) => x)),
      };
}

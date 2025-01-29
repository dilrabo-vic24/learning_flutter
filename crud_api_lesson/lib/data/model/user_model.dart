class UserModel {
  final Data? data;

  UserModel({
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final User? user;
  final String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  final String? id;
  final String? username;
  final bool? seller;
  final String? created;

  User({
    this.id,
    this.username,
    this.seller,
    this.created,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        seller: json["seller"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "seller": seller,
        "created": created,
      };
}

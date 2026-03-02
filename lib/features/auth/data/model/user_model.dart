class UserModel {
  String id;
  String name;
  String email;
  String nid;
  bool isVerified;
  String avatar;

  UserModel({
    this.id = "",
    required this.name,
    required this.email,
    this.isVerified = false,
    required this.nid,
   required this.avatar  ,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    nid: json['nid'],
    isVerified: json['isVerified'],
    avatar: json['avatar'],
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "nid": nid,
      "isVerified": isVerified,
      "avatar":avatar,
    };
  }
}
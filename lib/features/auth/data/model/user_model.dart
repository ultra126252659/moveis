class UserModel {
  String id;
  String name;
  String email;
  String nid;
  bool isVerified;
  String avatar;
  String phone;

  List<dynamic> watchList;
  List<dynamic> history;

  UserModel({
    this.id = "",
    required this.name,
    required this.email,
    this.isVerified = false,
    required this.nid,
    required this.avatar,
    required this.phone,
    this.watchList = const [],
    this.history = const [],
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'] ?? "",
    name: json['name'] ?? "",
    email: json['email'] ?? "",
    nid: json['nid'] ?? "",
    isVerified: json['isVerified'] ?? false,
    avatar: json['avatar'] ?? "",
    phone: json['phone'] ?? "",
    watchList: json['watchList'] ?? [],
    history: json['history'] ?? [],
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "nid": nid,
      "isVerified": isVerified,
      "avatar": avatar,
      "phone": phone,
      "watchList": watchList,
      "history": history,
    };
  }
}
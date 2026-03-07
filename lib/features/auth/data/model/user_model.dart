class UserModel {
  String id;
  String name;
  String email;
  String nid;
  bool isVerified;
  String avatar;
  String phone;

  List<String> watchList;
  List<String> history;

  UserModel({
    this.id = "",
    required this.name,
    required this.email,
    this.isVerified = false,
    required this.nid,
    required this.avatar,
    required this.phone,
    // إعطاء قيمة افتراضية عشان ميحصلش خطأ
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
    phone: json['phone'] ?? "", // دي كانت مكتوبة json['avatar'] بالغلط فصلحناها

    watchList: List<String>.from(json['watchList'] ?? []),
    history: List<String>.from(json['history'] ?? []),
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
      // رفع البيانات لفايربيز
      "watchList": watchList,
      "history": history,
    };
  }
}
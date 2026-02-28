
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moves_final_project/core/firebase_functions.dart';
import 'package:moves_final_project/features/data/model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? userModel;


  final List<String> avatars = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
  ];

  int selectedAvatarIndex = 1;


  void changeAvatar(int index) {
    selectedAvatarIndex = index;
    notifyListeners();
  }


  String get selectedAvatarPath => avatars[selectedAvatarIndex];



  AuthProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FirebaseFunctions.readUser();
    notifyListeners();
  }
}
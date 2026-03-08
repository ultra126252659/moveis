import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/features/auth/data/model/user_model.dart';
class UserProvider extends ChangeNotifier {
  UserModel? user;

  Future<void> loadUserData() async {
    user = await FirebaseFunctions.readUser();

    if (user == null) {
      await FirebaseFunctions.signOut();
    }

    notifyListeners();
  }
  void refreshUserLocally() {
    notifyListeners();
  }

}
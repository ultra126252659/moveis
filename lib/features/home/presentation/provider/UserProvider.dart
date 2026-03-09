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
  void addMovieToWatchListLocally(Map<String, dynamic> movieData) {
    if (user != null) {
      bool exists = user!.watchList.any((element) => element['id'] == movieData['id']);
      if (!exists) {
        user!.watchList = List.from(user!.watchList)..add(movieData);
        notifyListeners();
      }
    }
  }

  void addMovieToHistoryLocally(Map<String, dynamic> movieData) {
    if (user != null) {
      bool exists = user!.history.any((element) => element['id'] == movieData['id']);
      if (!exists) {
        user!.history = List.from(user!.history)..add(movieData);
        notifyListeners();
      }
    }
  }


}
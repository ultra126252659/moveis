import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moves_final_project/features/auth/data/model/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> saveUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<UserModel?> readUser() async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> data = await collection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return data.data();
  }

  static Future<void> updateUserData(
      UserModel updatedUser, {
        required Function onSuccess,
        required Function onError,
      }) async {
    try {
      var collection = getUsersCollection();
      await collection.doc(updatedUser.id).update(updatedUser.toJson());
      onSuccess();
    } catch (e) {
      onError(e.toString());
    }
  }

  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> login(
      String emailAddress,
      String password, {
        required Function onSuccess,
        required Function onError,
      }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      onSuccess();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      } else {
        onError(e.code);
      }
    }
  }

  static Future<void> deleteAccount({
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        await currentUser.delete();

        onSuccess();
      } else {
        onError("مفيش مستخدم مسجل دخول حالياً.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        onError("لأسباب أمنية، يرجى تسجيل الخروج والدخول مجدداً لتتمكن من مسح الحساب.");
      } else {
        onError(e.message ?? "حدث خطأ أثناء مسح الحساب.");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
  static Future<void> createUser(
      String email,
      String password,
      String name,
      String nid,
      String avatarPath,
      String phone,
      {
        required Function onSuccess,
        required Function(String) onError,
      }) async {
    try {
      print(" Creating account in Auth...");

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(name);
      await credential.user!.updatePhotoURL(avatarPath);

      print(" Account created successfully in Auth! (No Database)");

      onSuccess();

    } on FirebaseAuthException catch (e) {
      print("Auth Error: ${e.code}");

      if (e.code == 'weak-password') {
        onError('The password is too weak. It must be at least 6 characters.');
      } else if (e.code == 'email-already-in-use') {
        onError('This email is already in use. Try another one or login.');
      } else {
        onError(e.message ?? 'An error occurred during registration.');
      }
    } catch (e) {
      print(" General Error: $e");
      onError(e.toString());
    }
  }
}
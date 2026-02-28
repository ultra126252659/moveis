
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moves_final_project/features/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUsersCollection() {
    return  FirebaseFirestore.instance
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
     if (credential.user!.emailVerified) {
         onSuccess();
       } else {
         onError("Email not verified");
       }
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


  static Future<void> createUser(
      String email,
      String password,
      String name,
      String nid,
      String avatar, { // <--- 1. أضفنا متغير مسار الصورة هنا
        required Function onSuccess,
        required Function onError,
      }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var user = UserModel(
        name: name,
        email: email,
        nid: nid,
        id: credential.user!.uid,
        avatar: avatar, // <--- 2. تمرير الصورة للموديل ليتم حفظها في Firestore
      );
      print(user.toJson());
      await saveUser(user);
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      } else {
        onError(e.code);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
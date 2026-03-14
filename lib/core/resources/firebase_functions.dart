import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moves_final_project/features/auth/data/model/user_model.dart';

class FirebaseFunctions {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Object?> signInWithGoogle() async {
    try {

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {

        return Future.error('No Google account selected.');

      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final UserCredential userCredential = await _auth.signInWithCredential(credential);


      return userCredential.user;

    } catch (e) {
      print("حدث خطأ أثناء تسجيل الدخول: $e");
      return null;
    }


  }

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
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) return null;

    var collection = getUsersCollection();

    DocumentSnapshot<UserModel> data =
    await collection.doc(user.uid).get();

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
    await GoogleSignIn().signOut();
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
        await FirebaseAuth.instance.signOut();
        onError("For security reasons, you have been signed out. Please sign in again to delete your account");
      } else {
        onError(e.message ?? "Something went wrong.Please try deleting your account again later");
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
      String phone, {
        required Function onSuccess,
        required Function(String) onError,
      }) async {
    try {
      print("Creating account in Auth...");

      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        onError("User creation failed");
        return;
      }


      await user.updateDisplayName(name);
      await user.updatePhotoURL(avatarPath);


      UserModel newUser = UserModel(
        id: user.uid,
        name: name,
        email: email,
        avatar: avatarPath,
        phone: phone,
        nid: nid,
        watchList: [],
        history: [],
      );


      await FirebaseFunctions.saveUser(newUser);

      print("Account created successfully and saved to Firestore");

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
      print("General Error: $e");
      onError(e.toString());
    }
  }
  static Future<void> addToWatchList(Map<String, dynamic> movieData) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;
      var docRef = FirebaseFirestore.instance.collection('Users').doc(currentUser.uid);
      await docRef.set({
        'watchList': FieldValue.arrayUnion([movieData])
      }, SetOptions(merge: true));
    } catch (e) {
      print(" Error: $e");
    }
  }

  static Future<void> addToHistory(Map<String, dynamic> movieData) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;
      var docRef = FirebaseFirestore.instance.collection('Users').doc(currentUser.uid);
      await docRef.set({
        'history': FieldValue.arrayUnion([movieData])
      }, SetOptions(merge: true));
    } catch (e) {
      print(" Error adding to History: $e");
    }
  }
}

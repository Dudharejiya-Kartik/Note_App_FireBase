import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_firebase/model/note_model.dart';
import '../model/user_model.dart';
import 'auth_services.dart';

class FireStoreService {
  FireStoreService._();
  static final FireStoreService instance = FireStoreService._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userCollection = "allUsers";
  String noteCollection = "allNotes";

  UserModel? currentUser;

  BuildContext get context => context;

  // Add user
  Future<void> addUser({required User user}) async {
    Map<String, dynamic> data = {
      'uid': user.uid,
      'displayName': user.displayName ?? "Kartik",
      'email': user.email ?? "demo_mail",
      'phoneNumber': user.phoneNumber ?? "NO DATA",
      'photoURL': user.photoURL ??
          "https://static.vecteezy.com/system/resources/previews/002/318/271/non_2x/user-profile-icon-free-vector.jpg",
    };

    await firestore.collection(userCollection).doc(user.uid).set(data);
  }

  Future<void> getUser() async {
    DocumentSnapshot snapshot = await firestore
        .collection(userCollection)
        .doc(AuthServices.instance.auth.currentUser!.uid)
        .get();

    currentUser = UserModel.froMap(snapshot.data() as Map);
  }

  void addNote({required String title, required String content}) async {
    List<notemodel> allnotes = [];
    try {
      firestore
          .collection(userCollection)
          .doc(AuthServices.instance.auth.currentUser!.uid)
          .collection(noteCollection)
          .add({'title': title, 'content': content});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes() {
    return firestore
        .collection(userCollection)
        .doc(AuthServices.instance.auth.currentUser!.uid)
        .collection(noteCollection)
        .snapshots();
  }
}

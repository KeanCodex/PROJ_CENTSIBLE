import 'package:censible_app/utils/_initApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DbHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
    required String provider,
    String? phone,
    String? address,
    String? birthdate,
    String? photo,
  }) async {
    await _firestore.collection('UserAccount').doc(uid).update({
      'uid': uid,
      'name': name,
      'email': email,
      'provider': provider,
      'phone': phone ?? 'Unknown phoneNumber',
      'photo': photo ?? Application().icon.LOGO,
      'address': address ?? 'Unknown address',
      'birthDate': birthdate ?? 'Unknown birthdate',
      'createdAt': DateTime.now()
    });
  }

  Future<void> loginUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> createEmailAuth(TextEditingController emailController,
      TextEditingController passwordController) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> deleteUser(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }

  Stream<QuerySnapshot> getUsers() {
    return _firestore.collection('users').snapshots();
  }
}

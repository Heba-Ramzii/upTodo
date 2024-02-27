import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:uptodo/core/cache_helper/cache_data.dart';
import 'package:uptodo/core/cache_helper/cache_helper.dart';
import 'package:uptodo/core/cache_helper/cache_helper_keys.dart';
import 'package:uptodo/core/model/user_model.dart';
import 'package:uptodo/repo/home_repo.dart';

class AuthService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> registerUser(String email, String password) async {
    String hashedPassword = _hashPassword(password);

    // Create a new user document in Firestore
    await _firestore.collection('users').add({
      'email': email,
      'password': hashedPassword,
    });
  }
  static Future<bool> loginUser(String email, String password) async {
    String hashedPassword = _hashPassword(password);

     QuerySnapshot query = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: hashedPassword)
        .get();

    HomeRepo.userModel = UserModel(
      id: query.docs.first.id,
      email: email,
      password: hashedPassword,
    );

    if(query.docs.isEmpty) {
      return false;
    } else {
      await CacheHelper.saveData(key: CacheHelperKeys.id, value: query.docs.first.id);
      return true;
    }
  }
  static String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  static Future getUserByID() async {

    var response = await _firestore.collection('users').doc(CacheData.id).get();

    HomeRepo.userModel = UserModel.fromJson(response.data()!);
    HomeRepo.userModel.id = response.id;

  }

}
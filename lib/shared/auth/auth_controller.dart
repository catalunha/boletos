import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boletos/shared/models/user_model.dart';

class AuthController {
  UserModel? _user;
  UserModel get user => _user!;
  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    await sharedPreferencesInstance.setString('user', user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (sharedPreferencesInstance.containsKey('user')) {
      final json = sharedPreferencesInstance.get('user') as String;
      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }
    return;
  }
}

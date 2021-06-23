import 'package:boletos/shared/auth/auth_controller.dart';
import 'package:boletos/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginControler {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      print(response);
      if (response != null) {
        authController.setUser(
            context,
            UserModel(
                name: response.displayName!, photoUrl: response.photoUrl));
      } else {
        authController.setUser(context, null);
      }
    } catch (error) {
      print(error);
      authController.setUser(context, null);
    }
  }
}

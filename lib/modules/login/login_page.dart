import 'package:boletos/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:boletos/modules/login/google_login_button.dart';
import 'package:boletos/shared/themes/app_colors.dart';
import 'package:boletos/shared/themes/app_images.dart';
import 'package:boletos/shared/themes/app_text_styles.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginControler = LoginControler();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.4,
              color: AppColors.primary,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    AppImages.person,
                    width: 208,
                    height: 273,
                  ),
                  SizedBox(height: 10),
                  Image.asset(AppImages.logomini),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'organize seus boletos em um só lugar',
                      style: AppTextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  GoogleLoginButton(
                    onTap: () => loginControler.googleSignIn(context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

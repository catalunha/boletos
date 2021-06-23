import 'package:boletos/modules/home/home_page.dart';
import 'package:boletos/modules/login/login_page.dart';
import 'package:boletos/modules/splash/splash_page.dart';
import 'package:boletos/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BoletosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boletos-InNube',
        theme: ThemeData(
          primaryColor: AppColors.primary,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
        });
  }
}

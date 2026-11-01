import 'package:flutter/material.dart';
import 'package:plusone/auth/login_page.dart';
import 'package:plusone/auth/register_page.dart';
import 'package:plusone/theme/plusone_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'plusone.',
      debugShowCheckedModeBanner: false,
      theme: PlusoneTheme.light(),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        RegisterPage.routeName: (_) => const RegisterPage(),
      },
    );
  }
}

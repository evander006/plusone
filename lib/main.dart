import 'package:flutter/material.dart';
import 'package:plusone/frontend/ui/auth/widgets/login_screen.dart';
import 'package:plusone/frontend/ui/auth/widgets/register_screen.dart';
import 'package:plusone/frontend/ui/core/themes/plusone_theme.dart';

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
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
      },
    );
  }
}

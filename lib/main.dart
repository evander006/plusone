import 'package:flutter/material.dart';
import 'package:plusone/frontend/config/injection.dart';
import 'package:plusone/frontend/ui/auth/view_models/auth_view_model.dart';
import 'package:plusone/frontend/ui/auth/widgets/login_screen.dart';
import 'package:plusone/frontend/ui/auth/widgets/register_screen.dart';
import 'package:plusone/frontend/ui/core/themes/plusone_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<AuthViewModel>(),
      child: MaterialApp(
        // title: 'plusone.',
        debugShowCheckedModeBanner: false,
        theme: PlusoneTheme.light(),
        initialRoute: LoginScreen.routeName,

        routes: {
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
        },
      ),
    );
  }
}

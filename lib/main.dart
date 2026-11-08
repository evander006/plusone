import 'package:flutter/material.dart';
import 'package:plusone/frontend/config/injection.dart';
import 'package:plusone/frontend/routing/router.dart';
import 'package:plusone/frontend/ui/auth/view_models/auth_view_model.dart';
import 'package:plusone/frontend/ui/core/themes/plusone_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  startUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<AuthViewModel>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: PlusoneTheme.light(),
        routerConfig: router
      ),
    );
  }
}

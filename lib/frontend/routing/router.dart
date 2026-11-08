import 'package:go_router/go_router.dart';
import 'package:plusone/frontend/ui/auth/widgets/login_screen.dart';
import 'package:plusone/frontend/ui/auth/widgets/register_screen.dart';
import 'package:plusone/home_page.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  ],
);

GoRouter get router => _router;

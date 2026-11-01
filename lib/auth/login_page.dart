import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/auth/auth_shell.dart';
import 'package:plusone/auth/register_page.dart';
import 'package:plusone/theme/plusone_colors.dart';
import 'package:plusone/widgets/plusone_button.dart';
import 'package:plusone/widgets/plusone_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _submitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _submitting = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Вход: ${_emailController.text.trim()}',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        backgroundColor: PlusoneColors.ink,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Вход',
      subtitle: 'Хорошие планы. Лучшие люди. Войдите, чтобы продолжить.',
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Нет аккаунта?',
            style: GoogleFonts.inter(
              color: PlusoneColors.slate,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(RegisterPage.routeName);
            },
            child: Text(
              'Регистрация',
              style: GoogleFonts.inter(
                color: PlusoneColors.clubBlue,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'С возвращением',
              style: GoogleFonts.inter(
                color: PlusoneColors.ink,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Email и пароль — и вы снова в клубе.',
              style: GoogleFonts.inter(
                color: PlusoneColors.slate,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            PlusoneTextField(
              label: 'Email',
              hint: 'you@example.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.mail_outline_rounded,
              validator: (value) {
                final email = value?.trim() ?? '';
                if (email.isEmpty) return 'Введите email';
                if (!email.contains('@')) return 'Некорректный email';
                return null;
              },
            ),
            const SizedBox(height: 16),
            PlusoneTextField(
              label: 'Password',
              hint: '••••••••',
              controller: _passwordController,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              prefixIcon: Icons.lock_outline_rounded,
              onChanged: (_) {},
              suffix: IconButton(
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: PlusoneColors.slate,
                  size: 20,
                ),
              ),
              validator: (value) {
                if ((value ?? '').isEmpty) return 'Введите пароль';
                if ((value ?? '').length < 6) return 'Минимум 6 символов';
                return null;
              },
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Забыли пароль?',
                  style: GoogleFonts.inter(
                    color: PlusoneColors.slate,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            PlusoneButton(
              label: _submitting ? 'Входим…' : 'Войти',
              variant: PlusoneButtonVariant.club,
              onPressed: _submitting ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/frontend/ui/auth/widgets/auth_shell.dart';
import 'package:plusone/frontend/ui/auth/widgets/login_screen.dart';
import 'package:plusone/frontend/ui/core/themes/plusone_colors.dart';
import 'package:plusone/frontend/ui/core/widgets/plusone_button.dart';
import 'package:plusone/frontend/ui/core/widgets/plusone_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _submitting = false;

  static const _cities = [
    'Москва',
    'Санкт-Петербург',
    'Казань',
    'Екатеринбург',
    'Новосибирск',
    'Тбилиси',
    'Ереван',
    'Алматы',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _displayNameController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => _submitting = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Аккаунт создан: ${_displayNameController.text.trim()} · ${_cityController.text.trim()}',
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
      title: 'Присоединиться',
      subtitle: 'Создайте профиль и найдите своих людей рядом.',
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Уже есть аккаунт?',
            style: GoogleFonts.inter(
              color: PlusoneColors.slate,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            child: Text(
              'Войти',
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
              'Новый участник',
              style: GoogleFonts.inter(
                color: PlusoneColors.ink,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Email, имя, город и пароль — четыре шага до клуба.',
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
              label: 'Display name',
              hint: 'Как вас видеть другим',
              controller: _displayNameController,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.person_outline_rounded,
              validator: (value) {
                if ((value ?? '').trim().isEmpty) {
                  return 'Введите отображаемое имя';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            PlusoneTextField(
              label: 'City',
              hint: 'Город',
              controller: _cityController,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.location_on_outlined,
              suffix: PopupMenuButton<String>(
                tooltip: 'Выбрать город',
                icon: const Icon(
                  Icons.expand_more_rounded,
                  color: PlusoneColors.slate,
                ),
                onSelected: (city) {
                  _cityController.text = city;
                },
                itemBuilder: (context) => [
                  for (final city in _cities)
                    PopupMenuItem(value: city, child: Text(city)),
                ],
              ),
              validator: (value) {
                if ((value ?? '').trim().isEmpty) return 'Укажите город';
                return null;
              },
            ),
            const SizedBox(height: 16),
            PlusoneTextField(
              label: 'Password',
              hint: 'Минимум 6 символов',
              controller: _passwordController,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              prefixIcon: Icons.lock_outline_rounded,
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
            const SizedBox(height: 28),
            PlusoneButton(
              label: _submitting ? 'Создаём…' : 'Присоединиться',
              variant: PlusoneButtonVariant.acid,
              showArrow: true,
              onPressed: _submitting ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }
}

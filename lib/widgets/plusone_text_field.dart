import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/theme/plusone_colors.dart';
import 'package:plusone/theme/plusone_theme.dart';

class PlusoneTextField extends StatelessWidget {
  const PlusoneTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.suffix,
    this.prefixIcon,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Widget? suffix;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final height = PlusoneTheme.controlHeight(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.inter(
            color: PlusoneColors.clubBlue,
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: height + 8,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            onChanged: onChanged,
            style: GoogleFonts.inter(
              color: PlusoneColors.ink,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: prefixIcon == null
                  ? null
                  : Icon(prefixIcon, size: 20, color: PlusoneColors.clubBlue),
              suffixIcon: suffix,
            ),
          ),
        ),
      ],
    );
  }
}

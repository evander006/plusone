import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/theme/plusone_colors.dart';
import 'package:plusone/theme/plusone_theme.dart';

enum PlusoneButtonVariant { acid, club, outline, muted }

class PlusoneButton extends StatelessWidget {
  const PlusoneButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = PlusoneButtonVariant.acid,
    this.expanded = true,
    this.showArrow = false,
    this.compact,
  });

  final String label;
  final VoidCallback? onPressed;
  final PlusoneButtonVariant variant;
  final bool expanded;
  final bool showArrow;
  final bool? compact;

  @override
  Widget build(BuildContext context) {
    final isCompact = compact ?? !PlusoneTheme.isDesktop(context);
    final height = isCompact
        ? PlusoneTheme.controlHeightCompact
        : PlusoneTheme.controlHeightDesktop;
    final enabled = onPressed != null;

    final colors = switch (variant) {
      PlusoneButtonVariant.acid => (
          bg: PlusoneColors.acidLime,
          fg: PlusoneColors.ink,
          border: PlusoneColors.acidLime,
        ),
      PlusoneButtonVariant.club => (
          bg: PlusoneColors.clubBlue,
          fg: PlusoneColors.white,
          border: PlusoneColors.clubBlue,
        ),
      PlusoneButtonVariant.outline => (
          bg: PlusoneColors.white,
          fg: PlusoneColors.ink,
          border: PlusoneColors.line,
        ),
      PlusoneButtonVariant.muted => (
          bg: PlusoneColors.muted,
          fg: PlusoneColors.slate,
          border: PlusoneColors.muted,
        ),
    };

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: enabled ? colors.fg : PlusoneColors.slate,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (showArrow) ...[
          const SizedBox(width: 12),
          Icon(
            Icons.arrow_outward_rounded,
            size: 18,
            color: enabled ? colors.fg : PlusoneColors.slate,
          ),
        ],
      ],
    );

    return SizedBox(
      width: expanded ? double.infinity : null,
      height: height,
      child: Material(
        color: enabled ? colors.bg : PlusoneColors.muted,
        shape: StadiumBorder(
          side: BorderSide(color: enabled ? colors.border : PlusoneColors.muted),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: const StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

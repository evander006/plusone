import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/theme/plusone_colors.dart';

enum PlusoneBrandTone { onBlue, onLight }

class PlusoneBrand extends StatelessWidget {
  const PlusoneBrand({
    super.key,
    this.tone = PlusoneBrandTone.onBlue,
    this.compact = false,
  });

  final PlusoneBrandTone tone;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final accent = tone == PlusoneBrandTone.onBlue
        ? PlusoneColors.acidLime
        : PlusoneColors.clubBlue;
    final wordmark = tone == PlusoneBrandTone.onBlue
        ? PlusoneColors.white
        : PlusoneColors.ink;
    final symbolSize = compact ? 28.0 : 40.0;
    final wordSize = compact ? 24.0 : 30.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '+',
          style: GoogleFonts.inter(
            color: accent,
            fontSize: symbolSize,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          'plusone',
          style: GoogleFonts.inter(
            color: wordmark,
            fontSize: wordSize,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        Text(
          '.',
          style: GoogleFonts.inter(
            color: accent,
            fontSize: wordSize + 2,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
      ],
    );
  }
}

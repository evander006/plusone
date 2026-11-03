import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/frontend/ui/core/themes/plusone_colors.dart';
import 'package:plusone/frontend/ui/core/themes/plusone_theme.dart';
import 'package:plusone/frontend/ui/core/widgets/plusone_brand.dart';

/// Shared responsive chrome for auth screens (desktop split / mobile stacked).
class AuthShell extends StatelessWidget {
  const AuthShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.footer,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final desktop = PlusoneTheme.isDesktop(context);

    if (desktop) {
      return Scaffold(
        backgroundColor: PlusoneColors.cloud,
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: _BrandPanel(title: title, subtitle: subtitle),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 56,
                    ),
                    child: _FormCard(footer: footer, child: child),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: PlusoneColors.cloud,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: PlusoneColors.clubBlue,
              padding: EdgeInsets.fromLTRB(
                24,
                MediaQuery.paddingOf(context).top + 20,
                24,
                28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PlusoneBrand(compact: true),
                  const SizedBox(height: 28),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: PlusoneColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: PlusoneColors.white.withValues(alpha: 0.85),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                child: _FormCard(footer: footer, child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandPanel extends StatelessWidget {
  const _BrandPanel({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PlusoneColors.clubBlue,
      child: Stack(
        children: [
          Positioned(
            right: -60,
            bottom: -40,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PlusoneColors.acidLime.withValues(alpha: 0.18),
              ),
            ),
          ),
          Positioned(
            left: -40,
            top: 120,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PlusoneColors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 48, 56, 56),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PlusoneBrand(),
                const Spacer(),
                Text(
                  title.toUpperCase(),
                  style: GoogleFonts.inter(
                    color: PlusoneColors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: PlusoneColors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.45,
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({this.footer, required this.child});

  final Widget? footer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final desktop = PlusoneTheme.isDesktop(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(desktop ? 32 : 0),
      decoration: desktop
          ? BoxDecoration(
              color: PlusoneColors.white,
              borderRadius: BorderRadius.circular(PlusoneTheme.radiusPanel),
              border: Border.all(color: PlusoneColors.line),
              boxShadow: const [
                BoxShadow(
                  color: PlusoneColors.shadow,
                  blurRadius: 32,
                  offset: Offset(0, 12),
                ),
              ],
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          child,
          if (footer != null) ...[
            const SizedBox(height: 24),
            footer!,
          ],
        ],
      ),
    );
  }
}

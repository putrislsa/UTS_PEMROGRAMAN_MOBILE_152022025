import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../widgets/common_widgets.dart';
import 'main_shell.dart';

/// ==============================
/// 1) SPLASH SCREEN (5 detik)
/// ==============================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
    // Pindah otomatis ke Dashboard setelah 5 detik (sesuai UTS)
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(_fade(const MainShell()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Route _fade(Widget page) => PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient ringan
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFDFDFE), Color(0xFFF2F5F9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Aksen shimmer blob netral
          Align(
            alignment: const Alignment(-0.85, -0.8),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final v = (sin(_controller.value * 2 * pi) + 1) / 2;
                return Container(
                  width: 240 + 24 * v,
                  height: 240 + 24 * v,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.12),
                        Colors.transparent,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Foto kamu (ganti ke AssetImage jika pakai aset sendiri)
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: AppColors.primary.withOpacity(0.10),
                    backgroundImage: const AssetImage('assets/profile.jpg'),
                    child: const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 18),
                  Text('Welcome to my project', style: t.headlineLarge),
                  const SizedBox(height: 8),
                  Text(
                    'Nama: Putri Salsanabilah Muhhyidin ',
                    style: t.bodyLarge!.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 4),
                  Text('NIM: 152022025', style: t.bodyMedium),
                  const SizedBox(height: 22),
                  const Pill(text: 'Pemrograman Mobile — UTS'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

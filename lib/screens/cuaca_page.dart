import 'dart:math';
import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../widgets/common_widgets.dart';

/// ======================
/// 6) CUACA — data statis
/// ======================
class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    // Data statis
    const city = 'Bandung, ID';
    const temp = 24; // °C
    const humidity = 72; // %
    const windSpeed = 2.1;
    const condition = 'Berawan';
    const uvIndex = 3;
    const feelsLike = 22;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Cuaca',
            subtitle: 'Informasi cuaca real-time untuk lokasi Anda.',
          ),
          const SizedBox(height: 20),
          // Main Weather Card
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.08),
                  AppColors.primary.withOpacity(0.02),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Location
                Text(
                  city,
                  style: t.titleLarge!.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                // Animated Icon
                AnimatedBuilder(
                  animation: _c,
                  builder: (_, __) {
                    return Transform.rotate(
                      angle: _c.value * 2 * pi,
                      child: Icon(
                        Icons.wb_sunny_rounded,
                        size: 80,
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$temp',
                      style: t.headlineLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 64,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '°C',
                        style: t.titleLarge!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Condition & Feels Like
                Column(
                  children: [
                    Text(
                      condition,
                      style: t.titleLarge!.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Terasa seperti $feelsLike°C',
                      style: t.bodyMedium!.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Weather Details Grid
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _WeatherDetail(
                icon: Icons.opacity,
                label: 'Kelembapan',
                value: '$humidity%',
                color: AppColors.primary,
              ),
              _WeatherDetail(
                icon: Icons.air,
                label: 'Kecepatan Angin',
                value: '${windSpeed}m/s',
                color: AppColors.primarySoft,
              ),
              _WeatherDetail(
                icon: Icons.wb_sunny,
                label: 'Indeks UV',
                value: '$uvIndex',
                color: AppColors.primary,
              ),
              _WeatherDetail(
                icon: Icons.thermostat,
                label: 'Terasa Seperti',
                value: '$feelsLike°C',
                color: AppColors.primarySoft,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _WeatherDetail({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.08), color.withOpacity(0.02)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 12),
          Text(
            label,
            style: t.bodySmall!.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: t.titleLarge!.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

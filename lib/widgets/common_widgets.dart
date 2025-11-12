import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: t.headlineMedium),
        const SizedBox(height: 6),
        Text(subtitle, style: t.bodyMedium),
      ],
    );
  }
}

class Pill extends StatelessWidget {
  final String text;
  const Pill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.primary.withOpacity(0.10),
        border: Border.all(color: AppColors.primary.withOpacity(0.20)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class ContactDetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactDetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

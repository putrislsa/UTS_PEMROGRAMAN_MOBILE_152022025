import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../models/news.dart';
import '../widgets/common_widgets.dart';

/// ======================
/// 7) BERITA — list statis
/// ======================
class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  List<News> _fakeNews() => [
    News(
      title: 'Kampus Luncurkan Program Inovasi Mobile',
      teaser:
          'Mahasiswa menampilkan aplikasi dengan UI bersih & performa cepat.',
      time: '2 jam lalu',
      category: 'Kampus',
    ),
    News(
      title: 'Tips Lulus UTS Pemrograman Mobile',
      teaser: 'Fokus pada fungsional minimum + desain yang rapi & konsisten.',
      time: '5 jam lalu',
      category: 'Edukasi',
    ),
    News(
      title: 'Tren Light UI: Bersih & Ramah Mata',
      teaser: 'Kontras teks & hierarki visual menentukan kenyamanan baca.',
      time: 'Kemarin',
      category: 'Desain',
    ),
    News(
      title: 'Framework Flutter Versi 3.16 Dirilis',
      teaser: 'Fitur baru meningkatkan performa rendering hingga 40 persen.',
      time: '1 hari lalu',
      category: 'Teknologi',
    ),
  ];

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Kampus':
        return const Color(0xFF6366F1);
      case 'Edukasi':
        return const Color(0xFF8B5CF6);
      case 'Desain':
        return const Color(0xFFEC4899);
      case 'Teknologi':
        return const Color(0xFF3B82F6);
      default:
        return AppColors.primary;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Kampus':
        return Icons.school;
      case 'Edukasi':
        return Icons.lightbulb;
      case 'Desain':
        return Icons.palette;
      case 'Teknologi':
        return Icons.devices;
      default:
        return Icons.article;
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = _fakeNews();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: list.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return const SectionHeader(
            title: 'Berita',
            subtitle: 'Berita terkini dari dunia teknologi & kampus.',
          );
        }
        final n = list[i - 1];
        final categoryColor = _getCategoryColor(n.category ?? '');
        final categoryIcon = _getCategoryIcon(n.category ?? '');

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Badge
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            categoryColor.withOpacity(0.2),
                            categoryColor.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: categoryColor.withOpacity(0.3),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(categoryIcon, size: 14, color: categoryColor),
                          const SizedBox(width: 6),
                          Text(
                            n.category ?? 'Umum',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: categoryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Title
                    Text(
                      n.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Teaser
                    Text(
                      n.teaser,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1),
                    const SizedBox(height: 12),
                    // Footer: Time & Arrow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              n.time,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: AppColors.primary.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

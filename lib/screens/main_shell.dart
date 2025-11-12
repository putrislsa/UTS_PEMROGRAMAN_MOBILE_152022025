import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

/// ======================================
/// 2) MAIN SHELL dgn BottomNavigationBar
/// ======================================
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final _pages = const [
    BiodataPage(),
    KontakPage(),
    KalkulatorPage(),
    CuacaPage(),
    BeritaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B4857), Color(0xFF607089)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.phone_in_talk,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Text('Raritycaw', style: t.titleLarge),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _pages[_index],
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            label: 'Biodata',
          ),
          NavigationDestination(
            icon: Icon(Icons.contacts_outlined),
            label: 'Kontak',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            label: 'Kalkulator',
          ),
          NavigationDestination(
            icon: Icon(Icons.cloud_outlined),
            label: 'Cuaca',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            label: 'Berita',
          ),
        ],
      ),
    );
  }
}

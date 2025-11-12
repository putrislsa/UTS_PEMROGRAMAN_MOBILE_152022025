import 'dart:math';
import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../models/contact.dart';
import '../widgets/common_widgets.dart';

/// =======================
/// 4) KONTAK — daftar statis
/// =======================
class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  List<Contact> _generate() {
    const names = [
      'Aisyah',
      'Budi',
      'Citra',
      'Dimas',
      'Eka',
      'Fajar',
      'Galih',
      'Hani',
      'Indra',
      'Joko',
      'Kiki',
      'Lia',
      'Mira',
      'Nanda',
      'Omar',
    ]; // >= 15
    return List.generate(
      names.length,
      (i) => Contact(
        name: names[i],
        phone: '08${(Random(i).nextInt(900000000) + 100000000)}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contacts = _generate();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: contacts.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return const SectionHeader(
            title: 'Kontak',
            subtitle: 'Daftar telepon (statis) dengan avatar melingkar.',
          );
        }
        final c = contacts[i - 1];
        final color =
            Colors.blueGrey[(300 + (i * 50)) % 900] ?? Colors.blueGrey;
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Text(
                c.name.characters.first.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(c.name),
            subtitle: Text(
              c.phone,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header with avatar
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: color,
                            child: Text(
                              c.name.characters.first.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  c.occupation,
                                  style: const TextStyle(
                                    color: AppColors.primarySoft,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      ContactDetailTile(
                        icon: Icons.phone,
                        label: 'Telepon',
                        value: c.phone,
                      ),
                      const Divider(height: 1),
                      ContactDetailTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: c.email,
                      ),
                      const Divider(height: 1),
                      ContactDetailTile(
                        icon: Icons.location_on,
                        label: 'Alamat',
                        value: c.address,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Tutup'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

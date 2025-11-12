import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../widgets/common_widgets.dart';

/// =======================
/// 3) BIODATA — Form statis
/// =======================
class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nimCtrl = TextEditingController();
  final _hobiCtrl = TextEditingController();
  String? _gender = 'Laki-laki';
  String? _prodi = 'Informatika';
  DateTime? _tanggal;

  @override
  void dispose() {
    _namaCtrl.dispose();
    _nimCtrl.dispose();
    _hobiCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final res = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(now.year + 1),
      initialDate: _tanggal ?? DateTime(now.year - 20),
    );
    if (res != null) setState(() => _tanggal = res);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        'Tersimpan (statis): '
        'Nama=${_namaCtrl.text}, NIM=${_nimCtrl.text}, Prodi=$_prodi, '
        'Gender=$_gender, Tgl=${_tanggal?.toIso8601String().split("T").first}, '
        'Hobi=${_hobiCtrl.text}',
        style: const TextStyle(color: AppColors.textPrimary),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Biodata',
            subtitle: 'Isi data diri lengkap Anda dengan akurat dan lengkap.',
          ),
          const SizedBox(height: 20),
          // Profile Header Card
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border, width: 1.5),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary.withOpacity(0.15),
                  backgroundImage: const AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Lengkapi Profil Anda',
                  style: t.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Pastikan semua data terisi dengan benar',
                  style: t.bodyMedium!.copyWith(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Form Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Nama Lengkap
                  TextFormField(
                    controller: _namaCtrl,
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Nama wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  // NIM
                  TextFormField(
                    controller: _nimCtrl,
                    decoration: InputDecoration(
                      labelText: 'NIM (Nomor Induk Mahasiswa)',
                      prefixIcon: const Icon(Icons.numbers),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'NIM wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  // Program Studi
                  DropdownButtonFormField<String>(
                    value: _prodi,
                    decoration: InputDecoration(
                      labelText: 'Program Studi',
                      prefixIcon: const Icon(Icons.school),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Informatika',
                        child: Text('Informatika'),
                      ),
                      DropdownMenuItem(
                        value: 'Sistem Informasi',
                        child: Text('Sistem Informasi'),
                      ),
                      DropdownMenuItem(
                        value: 'Teknik Elektro',
                        child: Text('Teknik Elektro'),
                      ),
                    ],
                    onChanged: (v) => setState(() => _prodi = v),
                  ),
                  const SizedBox(height: 16),
                  // Jenis Kelamin
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                          child: Text(
                            'Jenis Kelamin',
                            style: t.labelLarge!.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        RadioListTile<String>(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          dense: true,
                          value: 'Laki-laki',
                          groupValue: _gender,
                          onChanged: (v) => setState(() => _gender = v),
                          title: const Text('Laki-laki'),
                          activeColor: AppColors.primary,
                        ),
                        RadioListTile<String>(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          dense: true,
                          value: 'Perempuan',
                          groupValue: _gender,
                          onChanged: (v) => setState(() => _gender = v),
                          title: const Text('Perempuan'),
                          activeColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Hobi
                  TextFormField(
                    controller: _hobiCtrl,
                    decoration: InputDecoration(
                      labelText: 'Hobi / Minat',
                      hintText: 'Contoh: membaca, fotografi',
                      prefixIcon: const Icon(Icons.favorite),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tanggal Lahir
                  GestureDetector(
                    onTap: _pickDate,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _tanggal == null
                                  ? 'Pilih Tanggal Lahir'
                                  : 'Tanggal: ${_tanggal!.toIso8601String().split("T").first}',
                              style: t.bodyMedium!.copyWith(
                                color: _tanggal == null
                                    ? AppColors.textSecondary
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Submit Button
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primarySoft],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _submit,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.save, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Simpan Data',
                                style: t.titleMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

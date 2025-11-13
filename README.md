# Raritycaw
Raritycaw adalah aplikasi mobile sederhana untuk mahasiswa yang menggabungkan beberapa fitur dasar dalam satu aplikasi: pengelolaan biodata, daftar kontak, kalkulator, informasi cuaca, dan berita kampus/teknologi.
Aplikasi ini menonjolkan tampilan yang bersih, modern, dan konsisten, dengan navigasi bawah (bottom navigation bar) sehingga pengguna mudah berpindah antar-halaman.

Fokus utamanya:
- Menampilkan identitas mahasiswa pembuat proyek.
- Menyediakan contoh form biodata yang rapi.
- Menampilkan daftar kontak dengan detail.
- Menyediakan kalkulator sederhana.
- Menunjukkan contoh tampilan cuaca real-time.
- Menyediakan daftar berita kampus/teknologi dalam bentuk kartu.

# Halaman Welcome / Opening Screen
![IMG-20251113-WA0013](https://github.com/user-attachments/assets/eff8a280-87b7-41cf-a3d7-36bd1e5f92fe)

Menampilkan foto profil mahasiswa dalam bentuk avatar lingkaran di tengah layar.
- Teks judul: “Welcome to my project”.
- Di bawahnya ada identitas:
- Nama: Putri Salsanabilah Muhhyidin
- NIM: 152022025
  
Fungsi halaman ini sebagai splash screen/halaman sambutan yang memperkenalkan pemilik proyek sebelum masuk ke fitur utama aplikasi.

# Halaman Biodata
![IMG-20251113-WA0014](https://github.com/user-attachments/assets/2d1d8238-658e-4b48-86db-8e9fec7f1137)


Judul di bagian atas: “Biodata”.

Subjudul: “Isi data diri lengkap Anda dengan akurat dan lengkap.”

Kartu besar di atas berisi:
- Foto profil lingkaran.
- Teks “Lengkapi Profil Anda” dan deskripsi singkat: “Pastikan semua data terisi dengan benar”.

Di bawahnya terdapat form biodata:
- Nama Lengkap (contoh: Putri Salsanabilah M).
- NIM (Nomor Induk Mahasiswa) (152022025).
- Program Studi (dropdown, contoh: Informatika).

Di bagian bawah layar ada bottom navigation bar dengan menu: Biodata, Kontak, Kalkulator, Cuaca, Berita.

Fungsi halaman ini:
- Sebagai form untuk menginput atau menampilkan data diri mahasiswa secara rapi.
- Contoh implementasi layout form + input di Flutter/Android.

# Halaman Kontak
![IMG-20251113-WA0015](https://github.com/user-attachments/assets/cb8a8fa6-8674-4b9f-99b9-feaaaf6937df)



Judul di atas: “Kontak”.

Subjudul: “Daftar telepon (statis) dengan avatar melingkar.”

Menampilkan list kontak berbentuk kartu:
- Contoh kontak: Aisyah, Budi, masing-masing dengan avatar huruf inisial (A, B) dan nomor telepon.

Saat salah satu kontak dipilih, muncul dialog / bottom sheet berisi detail lengkap:
- Nama kontak (Aisyah).
- Pekerjaan (contoh: Wiraswasta).
- Telepon, Email, dan Alamat (Jl. Contoh No. 45, Bandung).
- Tombol “Tutup” di bagian bawah untuk menutup dialog.

Fungsi halaman:
- Menampilkan implementasi daftar kontak statis.
- Menunjukkan cara menampilkan detail kontak dengan tampilan pop-up/bottom sheet.

# Halaman Kalkulator

![IMG-20251113-WA0016](https://github.com/user-attachments/assets/b26e6201-401e-45e1-8a38-9bb66933b183)


Judul: “Kalkulator”.

Subjudul: “Kalkulator profesional dengan desain modern dan intuitif.”

Di bagian tengah atas tampil operasi yang sedang dihitung, contoh: “6 × 5 =” dan hasil “30”.

Di bawahnya terdapat layout tombol kalkulator:
- Tombol fungsi: AC, C, %, ÷, ×, -, +, =.
- Tombol angka: 0–9 dan tombol titik/desimal.
- Desain tombol angka berwarna putih, tombol operasi berwarna oranye sehingga mudah dibedakan.

Fungsi halaman:
- Sebagai kalkulator sederhana empat operasi (tambah, kurang, kali, bagi).
- Contoh implementasi perhitungan aritmatika dan UI grid button.

# Halaman Cuaca

![IMG-20251113-WA0017](https://github.com/user-attachments/assets/d2af518a-5366-4674-9f11-4cc72f791b62)


Judul: “Cuaca”.

Subjudul: “Informasi cuaca real-time untuk lokasi Anda.”

Kartu utama di tengah menampilkan:
- Lokasi: Bandung, ID.
- Ikon matahari.
- Suhu: 24°C.
- Keterangan: “Berawan” dan teks “Terasa seperti 22°C”.

Di bawah kartu utama terdapat beberapa kartu kecil:
- Kelembapan: 72%.
- Kecepatan Angin: 2.1 m/s.

Fungsi halaman:

- Mejadi contoh tampilan weather dashboard sederhana.
- Menunjukkan bagaimana informasi cuaca bisa ditampilkan dengan gaya kartu (card).

# Halaman Berita
![IMG-20251113-WA0018](https://github.com/user-attachments/assets/46802f7a-d481-4b58-ab3a-1d528e2a0ab4)



Judul: “Berita”.

Subjudul: “Berita terkini dari dunia teknologi & kampus.”

Menampilkan beberapa kartu berita dengan desain modern:

Berita 1
- Tag kategori: “Kampus”.
- Judul: “Kampus Luncurkan Program Inovasi Mobile”.
- Deskripsi singkat: “Mahasiswa menampilkan aplikasi dengan UI bersih & performa cepat.”
- Waktu: “2 jam lalu”.

Berita 2
- Tag kategori: “Edukasi”.
- Judul: “Tips Lulus UTS Pemrograman Mobile”.
- Deskripsi: “Fokus pada fungsional minimum + desain yang rapi & konsisten.”
- Waktu: “5 jam lalu”.

Setiap kartu memiliki ikon panah di kanan bawah sebagai indikasi bisa dibuka/di-tap.

Fungsi halaman:
- Menampilkan daftar berita dalam bentuk list card.
- Contoh implementasi konten informatif yang up-to-date (statis/dummy) tentang kampus dan teknologi.
  
# utspemob_putri

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

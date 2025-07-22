# 💸 Aplikasi Keuangan Sederhana
Aplikasi ini adalah program berbasis terminal (command-line interface) yang dibuat menggunakan bahasa Dart, bertujuan untuk membantu pengguna mencatat, mengelola, dan meninjau pemasukan dan pengeluaran harian secara sederhana. Antarmuka pengguna didesain dengan tampilan teks berwarna agar lebih menarik dan mudah dibaca.

## 📦 Struktur & Fitur
- ✅ Tambah Transaksi
Pengguna dapat menambahkan catatan keuangan berupa:
1. Tipe transaksi: pemasukan 💰 atau pengeluaran 💸
2. Jumlah uang
3. Deskripsi (opsional)
4. Tanggal dan waktu akan dicatat secara otomatis saat input
5. Transaksi yang dimasukkan langsung memengaruhi saldo total sesuai jenisnya.

- ✏️ Edit Transaksi
Fitur ini memungkinkan pengguna:
1. Memilih transaksi yang ingin diedit dari daftar
2. Mengganti jumlah dan deskripsi
3. Saldo akan diperbarui berdasarkan nilai yang baru

- 🗑️ Hapus Satu atau Beberapa Transaksi
Terdapat dua cara untuk menghapus data:
1. Satu transaksi: pengguna memilih berdasarkan nomor urutan
2. Multiple transaksi: input beberapa nomor transaksi yang dipisahkan koma
Namun, dalam versi terakhir, penghapusan hanya bersifat visual dari daftar transaksi. Saldo tetap tidak diubah meskipun data dihapus, agar histori keuangan tetap terjaga.

- 💰 Ringkasan Saldo
Menampilkan informasi:
1. Total pemasukan
2. Total pengeluaran
3. Saldo akhir (pemasukan - pengeluaran)
4. Angka ditampilkan dengan format mata uang Rupiah, dan warna hijau/merah tergantung nilainya positif/negatif.

📆 Filter Transaksi Hari Ini
Fitur ini menyaring dan menampilkan hanya transaksi yang dibuat pada hari yang sama saat aplikasi dijalankan.
Ini berguna untuk melihat aktivitas keuangan terbaru tanpa perlu menelusuri seluruh riwayat.

- 🌈 Tampilan Terminal Berwarna
Untuk meningkatkan pengalaman pengguna, teks ditampilkan dengan kode warna ANSI:
1. Hijau: pemasukan atau status sukses
2. Merah: pengeluaran atau kesalahan
3. Kuning: peringatan
4. Cyan/Biru: heading atau menu
5. Abu-abu: catatan atau petunjuk

- 🚪 Keluar
Menutup aplikasi secara bersih setelah pengguna memilih menu "0".

## ▶️ Cara Menjalankan
Syarat:
Sudah menginstal Dart SDK di komputer

Langkah:
1. Buka terminal atau command prompt
2. Masuk ke folder proyek
3. Jalankan perintah berikut:
```bash
dart main.dart

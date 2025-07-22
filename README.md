# 💸 Aplikasi Keuangan Sederhana
Aplikasi ini adalah sebuah program berbasis terminal (command-line interface) yang dibuat menggunakan bahasa Dart, bertujuan untuk membantu pengguna mencatat, mengelola, dan meninjau pemasukan dan pengeluaran keuangan harian secara sederhana. Antarmuka pengguna didesain dengan tampilan teks berwarna agar lebih menarik dan mudah dibaca.

## 📦 Struktur & Fitur
1.Tambah Transaksi:
Pada fitur ini para pengguna dapat menambahkan catatan keuangan berupa:
1. Tipe transaksi:
     a. Pemasukan 💰
     b. Pengeluaran💸
3. Input jumlah uang
4. Deskripsi (opsional)
5. Tanggal dan waktu akan dicatat secara otomatis saat pengguna menginput nominal
6. Transaksi yang dimasukkan langsung memengaruhi saldo total sesuai jenisnya.

2. Riwayat Transaksi:
Fitur ini memberikan tampilan informasi mengenai riwayat transaksi, seperti        transaksi pemasukan atau pengeluaran keuangan
   
3.✏️ Edit Transaksi
Fitur ini memungkinkan pengguna:
1. Memilih transaksi yang ingin diedit dari daftar
2. Mengganti jumlah dan deskripsi
3. Saldo akan diperbarui berdasarkan nilai yang baru

4. 🗑️ Hapus Satu atau Beberapa Transaksi
Terdapat dua cara untuk menghapus data:
1. Satu transaksi: pengguna memilih berdasarkan transaksi yang ingin dihapus
2. Multiple transaksi: input beberapa nomor transaksi yang dipisahkan koma
   namun, dalam versi terakhir, penghapusan hanya bersifat visual dari daftar         transaksi. Saldo tetap ada walaupun data transaksi dihapus.

5.💰 Ringkasan Saldo
Menampilkan informasi:
1. Total pemasukan dan pengeluaran keuangan
2. Saldo akhir (pemasukan - pengeluaran)
3. Angka ditampilkan dengan format mata uang Rupiah, dan warna hijau/merah tergantung nilainya positif/negatif.

6. 📆 Filter Transaksi Hari Ini
Fitur ini menyaring dan menampilkan hanya transaksi yang dibuat pada hari yang sama atau transaksi terakhir kali saat aplikasi dijalankan. Fitur ini dapat berguna untuk melihat aktivitas keuangan terbaru tanpa perlu menelusuri seluruh riwayat.

7. 🚪 Keluar
Menutup aplikasi secara bersih setelah pengguna memilih menu "0".

8. 🌈 Tampilan Terminal Berwarna
Untuk meningkatkan pengalaman pengguna, teks ditampilkan dengan kode warna ANSI:
1. Hijau: pemasukan atau status sukses
2. Merah: pengeluaran atau kesalahan
3. Kuning: peringatan
4. Cyan/Biru: heading atau menu
5. Abu-abu: catatan atau petunjuk

### ▶️ Cara Menjalankan
Syarat:
Sudah menginstal Dart SDK di komputer

Langkah:
1. Buka terminal atau command prompt
2. Masuk ke folder proyek
3. Jalankan perintah berikut:
```bash
dart main.dart

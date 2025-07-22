# 💸 Aplikasi Keuangan Sederhana
Aplikasi ini adalah sebuah program berbasis terminal (command-line interface) yang dibuat menggunakan bahasa Dart, bertujuan untuk membantu pengguna mencatat, mengelola, dan meninjau pemasukan dan pengeluaran keuangan harian secara sederhana. Antarmuka pengguna didesain dengan tampilan teks berwarna agar lebih menarik dan mudah dibaca.

## 📦 Struktur & Fitur
1.Tambah Transaksi:
Pada fitur ini para pengguna dapat menambahkan catatan keuangan berupa:
a.. Tipe transaksi:
     i. Pemasukan 💰
     ii. Pengeluaran💸
b. Input jumlah uang
c. Deskripsi (opsional)
d. Tanggal dan waktu akan dicatat secara otomatis saat pengguna menginput nominal
e. Transaksi yang dimasukkan langsung memengaruhi saldo total sesuai jenisnya.

2. Riwayat Transaksi:
Fitur ini memberikan tampilan informasi mengenai riwayat transaksi, seperti transaksi pemasukan atau pengeluaran keuangan
   
3.Edit Transaksi
Fitur ini memungkinkan pengguna:
a. Memilih transaksi yang ingin diedit dari daftar
b. Mengganti jumlah dan deskripsi
c. Saldo akan diperbarui berdasarkan nilai yang baru

4. Hapus Satu atau Beberapa Transaksi
Terdapat dua cara untuk menghapus data:
a. Satu transaksi: pengguna memilih berdasarkan transaksi yang ingin dihapus
b. Multiple transaksi: input beberapa nomor transaksi yang dipisahkan koma, namun penghapusan hanya bersifat visual dari daftar transaksi. Saldo tetap ada walaupun data transaksi dihapus.

5.Ringkasan Saldo
Menampilkan informasi:
a. Total pemasukan dan pengeluaran keuangan
b. Saldo akhir (pemasukan - pengeluaran)
c. Angka ditampilkan dengan format mata uang Rupiah, dan warna hijau/merah tergantung nilainya positif/negatif.

6. Filter Transaksi Hari Ini
Fitur ini menyaring dan menampilkan hanya transaksi yang dibuat pada hari yang sama atau transaksi terakhir kali saat aplikasi dijalankan. Fitur ini dapat berguna untuk melihat aktivitas keuangan terbaru tanpa perlu menelusuri seluruh riwayat.

7. Keluar
Menutup aplikasi secara bersih setelah pengguna memilih menu "0".

8. Tampilan Terminal Berwarna
Untuk meningkatkan pengalaman pengguna, teks ditampilkan dengan kode warna ANSI:
1. Hijau: pemasukan atau status sukses
2. Merah: pengeluaran atau kesalahan
3. Kuning: peringatan
4. Cyan/Biru: heading atau menu
5. Abu-abu: catatan atau petunjuk

### ▶️ Cara Menjalankan
Syarat:
Sudah menginstal Dart SDK di komputer

Langkah-Langkah untuk Menggunakan:
1. Buka terminal atau command prompt
2. Masuk ke folder proyek
3. Jalankan perintah berikut:
```bash
dart main.dart

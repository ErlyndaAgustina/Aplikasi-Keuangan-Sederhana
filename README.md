# 💸 Aplikasi Keuangan Sederhana

Aplikasi ini adalah sebuah program berbasis terminal (command-line interface) yang dibuat menggunakan bahasa Dart, bertujuan untuk membantu pengguna mencatat, mengelola, dan meninjau pemasukan dan pengeluaran keuangan harian secara sederhana. Antarmuka pengguna didesain dengan tampilan teks berwarna agar lebih menarik dan mudah dibaca.

## 📦 Struktur & Fitur

1. **Tambah Transaksi**  
   Pada fitur ini para pengguna dapat menambahkan catatan keuangan berupa:
   - **Tipe transaksi:**
     - Pemasukan 💰
     - Pengeluaran 💸
   - Input jumlah uang
   - Deskripsi *(opsional)*
   - Tanggal dan waktu akan dicatat secara otomatis saat pengguna menginput nominal
   - Transaksi yang dimasukkan langsung memengaruhi saldo total sesuai jenisnya

2. **Riwayat Transaksi**  
   Fitur ini memberikan tampilan informasi mengenai riwayat transaksi, seperti transaksi pemasukan atau pengeluaran keuangan.

3. **Edit Transaksi**  
   Fitur ini memungkinkan pengguna:
   - Memilih transaksi yang ingin diedit dari daftar
   - Mengganti jumlah dan deskripsi
   - Saldo akan diperbarui berdasarkan nilai yang baru

4. **Hapus Satu atau Beberapa Transaksi**  
   Terdapat dua cara untuk menghapus data:
   - **Satu transaksi**: pengguna memilih berdasarkan transaksi yang ingin dihapus
   - **Multiple transaksi**: input beberapa nomor transaksi yang dipisahkan koma.  
     Penghapusan hanya bersifat visual dari daftar transaksi.  
     *Saldo tetap ada walaupun data transaksi dihapus.*

5. **Ringkasan Saldo**  
   Menampilkan informasi:
   - Total pemasukan dan pengeluaran keuangan
   - Saldo akhir *(pemasukan - pengeluaran)*
   - Angka ditampilkan dengan format mata uang Rupiah, dan warna hijau/merah tergantung nilainya positif/negatif.

6. **Filter Transaksi Hari Ini**  
   Fitur ini menyaring dan menampilkan hanya transaksi yang dibuat pada hari yang sama atau transaksi terakhir kali saat aplikasi dijalankan.  
   Fitur ini berguna untuk melihat aktivitas keuangan terbaru tanpa perlu menelusuri seluruh riwayat.

7. **Keluar**  
   Menutup aplikasi secara bersih setelah pengguna memilih menu "0".

8. **Tampilan Terminal Berwarna**  
   Untuk meningkatkan pengalaman pengguna, teks ditampilkan dengan kode warna ANSI:
   - Hijau: pemasukan atau status sukses
   - Merah: pengeluaran atau kesalahan
   - Kuning: peringatan
   - Cyan/Biru: heading atau menu
   - Abu-abu: catatan atau petunjuk

### ▶️ Cara Menjalankan

**Syarat:**  
Sudah menginstal Dart SDK di komputer

**Langkah-langkah Penggunaan:**

1. Buka terminal atau command prompt  
2. Masuk ke folder proyek  
3. Jalankan perintah berikut:

```bash
dart main.dart

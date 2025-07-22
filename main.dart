import 'dart:io';

class Transaksi {
  String tipe;
  double jumlah;
  String? deskripsi;
  DateTime tanggal;

  Transaksi(this.tipe, this.jumlah, this.deskripsi, this.tanggal);
}

class Saldo {
  double totalPemasukan;
  double totalPengeluaran;

  Saldo(this.totalPemasukan, this.totalPengeluaran);

  double get saldoAkhir => totalPemasukan - totalPengeluaran;

  Map<String, dynamic> toJson() => {
        'totalPemasukan': totalPemasukan,
        'totalPengeluaran': totalPengeluaran,
      };

  factory Saldo.fromJson(Map<String, dynamic> json) {
    return Saldo(
      json['totalPemasukan'] ?? 0.0,
      json['totalPengeluaran'] ?? 0.0,
    );
  }
}

List<Transaksi> daftarTransaksi = [];
Saldo saldoTotal = Saldo(0, 0);

String warnaHijau(String text) => '\x1B[32m$text\x1B[0m';
String warnaAbuAbu(String text) => '\x1B[90m$text\x1B[0m';
String warnaMerah(String text) => '\x1B[31m$text\x1B[0m';
String warnaKuning(String text) => '\x1B[33m$text\x1B[0m';
String warnaBiru(String text) => '\x1B[34m$text\x1B[0m';
String warnaMagenta(String text) => '\x1B[35m$text\x1B[0m';
String warnaCyan(String text) => '\x1B[36m$text\x1B[0m';
String warnaPutih(String text) => '\x1B[37m$text\x1B[0m';

void tambahTransaksi() {
  print(warnaCyan('\n📝 TAMBAH TRANSAKSI'));
  print(warnaCyan('═' * 40));
  print(warnaKuning('Pilih tipe transaksi:'));
  print(warnaHijau('1. Pemasukan 💰'));
  print(warnaMerah('2. Pengeluaran 💸'));
  stdout.write(warnaPutih('Pilihan (1/2): '));
  String pilihan = stdin.readLineSync()!;
  String tipe;

  if (pilihan == '1') {
    tipe = 'pemasukan';
  } else if (pilihan == '2') {
    tipe = 'pengeluaran';
  } else {
    print(warnaMerah('❌ Pilihan tidak valid!\n'));
    return;
  }

  stdout.write(warnaPutih('Masukkan jumlah: Rp'));
  double jumlah = double.tryParse(stdin.readLineSync()!) ?? 0;

  stdout.write(warnaPutih('Masukkan deskripsi (opsional): '));
  String? deskripsi = stdin.readLineSync();
  if (deskripsi?.trim().isEmpty ?? true) deskripsi = null;

  if (tipe == 'pemasukan') {
    saldoTotal.totalPemasukan += jumlah;
  } else {
    saldoTotal.totalPengeluaran += jumlah;
  }

  daftarTransaksi.add(Transaksi(tipe, jumlah, deskripsi, DateTime.now()));
  print(warnaHijau('\n✅ Transaksi berhasil ditambahkan.\n'));
}

void tampilkanTransaksi() {
  if (daftarTransaksi.isEmpty) {
    print(warnaKuning('\n📭 Belum ada transaksi.\n'));
    return;
  }

  print(warnaCyan('\n📋 DAFTAR TRANSAKSI'));
  print(warnaCyan('═' * 60));
  for (int i = 0; i < daftarTransaksi.length; i++) {
    var t = daftarTransaksi[i];
    String tipeBerwarna = t.tipe == 'pemasukan'
        ? warnaHijau('💰 ${t.tipe.toUpperCase()}')
        : warnaMerah('💸 ${t.tipe.toUpperCase()}');

    print(
      warnaBiru('${i + 1}. ') +
          '$tipeBerwarna\n'
              '   ${warnaPutih('Jumlah   :')} Rp${formatRupiah(t.jumlah)}\n'
              '   ${warnaPutih('Deskripsi:')} ${t.deskripsi ?? '-'}\n'
              '   ${warnaPutih('Tanggal  :')} ${formatTanggal(t.tanggal)} - ${formatWaktu(t.tanggal)}',
    );
    if (i < daftarTransaksi.length - 1) {
      print(warnaCyan('-' * 60));
    }
  }
  print(warnaCyan('═' * 60 + '\n'));
}

void editTransaksi() {
  tampilkanTransaksi();
  if (daftarTransaksi.isEmpty) return;

  stdout.write(warnaPutih('Pilih nomor transaksi yang ingin diedit: '));
  int index = (int.tryParse(stdin.readLineSync()!) ?? 0) - 1;

  if (index < 0 || index >= daftarTransaksi.length) {
    print(warnaMerah('❌ Index tidak valid.\n'));
    return;
  }

  var transaksi = daftarTransaksi[index];
  print(warnaCyan('\n✏️ EDIT TRANSAKSI'));
  print(warnaCyan('═' * 40));
  print('${warnaPutih('Tipe     :')} ${transaksi.tipe}');
  print('${warnaPutih('Jumlah   :')} Rp${formatRupiah(transaksi.jumlah)}');
  print('${warnaPutih('Deskripsi:')} ${transaksi.deskripsi ?? "-"}');
  print(warnaKuning('\nTekan Enter untuk melanjutkan...'));
  stdin.readLineSync();

  // Kurangi jumlah lama dari total
  if (transaksi.tipe == 'pemasukan') {
    saldoTotal.totalPemasukan -= transaksi.jumlah;
  } else {
    saldoTotal.totalPengeluaran -= transaksi.jumlah;
  }

  stdout.write(warnaPutih('Masukkan jumlah baru: Rp'));
  double jumlah = double.tryParse(stdin.readLineSync()!) ?? 0;

  stdout.write(warnaPutih('Masukkan deskripsi baru: '));
  String? deskripsi = stdin.readLineSync();
  if (deskripsi?.trim().isEmpty ?? true) deskripsi = null;

  // Tambah jumlah baru ke total
  if (transaksi.tipe == 'pemasukan') {
    saldoTotal.totalPemasukan += jumlah;
  } else {
    saldoTotal.totalPengeluaran += jumlah;
  }

  daftarTransaksi[index].jumlah = jumlah;
  daftarTransaksi[index].deskripsi = deskripsi;

  print(warnaHijau('\n✅ Transaksi berhasil diperbarui.\n'));
}


void hapusMultipleTransaksi() {
  tampilkanTransaksi();
  if (daftarTransaksi.isEmpty) return;

  stdout.write(
    warnaPutih(
      'Masukkan nomor transaksi yang ingin dihapus (pisahkan dengan koma jika ingin menghapus semua transaksi): ',
    ),
  );
  String? input = stdin.readLineSync();
  if (input == null || input.trim().isEmpty) {
    print(warnaMerah('❌ Tidak ada input.\n'));
    return;
  }

  List<int> indeks = input
      .split(',')
      .map((e) => int.tryParse(e.trim()))
      .where((e) => e != null && e > 0 && e <= daftarTransaksi.length)
      .map((e) => e! - 1)
      .toList();

  if (indeks.isEmpty) {
    print(warnaMerah('❌ Tidak ada nomor valid.\n'));
    return;
  }

  print(warnaMerah('\n⚠️ Konfirmasi Penghapusan'));
  for (var i in indeks) {
    var t = daftarTransaksi[i];
    print(
      '${warnaPutih('•')} ${t.tipe.toUpperCase()} - Rp${formatRupiah(t.jumlah)} - ${t.deskripsi ?? "-"}',
    );
  }

  stdout.write(
    warnaKuning('\nYakin ingin menghapus semua transaksi ini? (y/n): '),
  );
  String? konfirmasi = stdin.readLineSync();
  if (konfirmasi?.toLowerCase() != 'y') {
    print(warnaMerah('\n❌ Penghapusan dibatalkan.\n'));
    return;
  }

  indeks.sort((a, b) => b.compareTo(a));
  for (var i in indeks) {
    daftarTransaksi.removeAt(i);
  }

  print(warnaHijau('\n✅ ${indeks.length} transaksi berhasil dihapus.\n'));
}

void tampilkanSaldo() {
  print(warnaCyan('\n💰 RINGKASAN KEUANGAN'));
  print(warnaCyan('═' * 40));
  print(
    '${warnaPutih('Total Pemasukan  :')} ${warnaHijau('Rp${formatRupiah(saldoTotal.totalPemasukan)}')}',
  );
  print(
    '${warnaPutih('Total Pengeluaran:')} ${warnaMerah('Rp${formatRupiah(saldoTotal.totalPengeluaran)}')}',
  );
  print(warnaCyan('═' * 40));
  print(
    '${warnaPutih('Saldo Akhir      :')} ${saldoTotal.saldoAkhir >= 0 ? warnaHijau('Rp${formatRupiah(saldoTotal.saldoAkhir)}') : warnaMerah('Rp${formatRupiah(saldoTotal.saldoAkhir)}')}',
  );
}

void filterHariIni() {
  var now = DateTime.now();
  var hariIni = daftarTransaksi.where(
    (t) =>
        t.tanggal.year == now.year &&
        t.tanggal.month == now.month &&
        t.tanggal.day == now.day,
  );

  if (hariIni.isEmpty) {
    print(warnaKuning('\n📭 Tidak ada transaksi hari ini.'));
  } else {
    print(warnaCyan('\n📆 RIWAYAT TRANSAKSI TERAKHIR'));
    print(warnaCyan('═' * 60));
    int nomor = 1;
    for (var t in hariIni) {
      String tipeBerwarna = t.tipe == 'pemasukan'
          ? warnaHijau('💰 ${t.tipe.toUpperCase()}')
          : warnaMerah('💸 ${t.tipe.toUpperCase()}');

      print(
        warnaBiru('$nomor. ') +
            '$tipeBerwarna\n'
                '   ${warnaPutih('Jumlah   :')} Rp${formatRupiah(t.jumlah)}\n'
                '   ${warnaPutih('Deskripsi:')} ${t.deskripsi ?? '-'}\n'
                '   ${warnaPutih('Tanggal  :')} ${formatTanggal(t.tanggal)} - ${formatWaktu(t.tanggal)}',
      );
      if (nomor < hariIni.length) {
        print(warnaCyan('-' * 60));
      }
      nomor++;
    }
    print(warnaCyan('═' * 60));
  }
  print(warnaKuning('\nTekan Enter untuk melanjutkan...'));
  stdin.readLineSync();
}

String formatTanggal(DateTime tanggal) =>
    '${tanggal.day.toString().padLeft(2, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.year}';
String formatWaktu(DateTime tanggal) =>
    '${tanggal.hour.toString().padLeft(2, '0')}:${tanggal.minute.toString().padLeft(2, '0')}';

String formatRupiah(double nilai) {
  return nilai.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match match) => '${match[1]}.',
  );
}

void main() {
  while (true) {
    print(warnaCyan('\n📌 MENU UTAMA'));
    print(warnaCyan('═' * 30));
    print(warnaPutih('1. Tambah Transaksi'));
    print(warnaPutih('2. Riwayat Transaksi'));
    print(warnaPutih('3. Edit Transaksi'));
    print(warnaPutih('4. Hapus Beberapa Transaksi'));
    print(warnaPutih('5. Saldo'));
    print(warnaPutih('6. Transaksi Hari Ini'));
    print(warnaPutih('0. Keluar'));

    stdout.write(warnaPutih('\nPilih menu: '));
    String? pilihan = stdin.readLineSync();
    switch (pilihan) {
      case '1':
        tambahTransaksi();
        break;
      case '2':
        tampilkanTransaksi();
        break;
      case '3':
        editTransaksi();
        break;
      case '4':
        hapusMultipleTransaksi();
        break;
      case '5':
        tampilkanSaldo();
        break;
      case '6':
        filterHariIni();
        break;
      case '0':
        print(warnaHijau('\n👋 Terima kasih telah menggunakan aplikasi.\n'));
        exit(0);
      default:
        print(warnaMerah('❌ Menu tidak valid.'));
    }

    print(warnaAbuAbu('\nTekan Enter untuk kembali ke menu...'));
    stdin.readLineSync();
  }
}
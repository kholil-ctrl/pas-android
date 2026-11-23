import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/model/data_model.dart';
import 'package:pas/utils/format_rupiah.dart';

class TransaksiController extends GetxController {
  late DataModel makanan;

  TextEditingController txtJumlah = TextEditingController(text: "1");

  // hasil perhitungan (muncul setelah tombol Bayar ditekan)
  var sudahBayar = false.obs;
  var subtotal = 0.0.obs;
  var ppn = 0.0.obs;
  var totalBayar = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // ambil data makanan yang dikirim dari halaman Home
    makanan = Get.arguments;
  }

  void bayar() {
    // ubah teks jumlah jadi angka, kalau bukan angka hasilnya null
    int? jumlah = int.tryParse(txtJumlah.text);

    if (jumlah == null || jumlah <= 0) {
      Get.snackbar("error", "jumlah makanan harus angka lebih dari 0");
      return;
    }

    // rumus sesuai soal
    subtotal.value = (makanan.hargaMakanan * jumlah).toDouble();
    ppn.value = subtotal.value * 0.05;
    totalBayar.value = subtotal.value + ppn.value;
    sudahBayar.value = true;

    // tampilkan juga di dialog konfirmasi
    Get.defaultDialog(
      title: "Rincian Pembayaran",
      middleText: "${makanan.namaMakanan} x $jumlah\n\n"
          "Subtotal : ${formatRupiah(subtotal.value)}\n"
          "PPN (5%) : ${formatRupiah(ppn.value)}\n"
          "Total Bayar : ${formatRupiah(totalBayar.value)}",
      textConfirm: "OK",
      onConfirm: () => Get.back(),
    );
  }
}

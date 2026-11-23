import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pas/controller/transaksi_controller.dart';
import 'package:pas/utils/format_rupiah.dart';

class TransaksiPage extends StatelessWidget {
  TransaksiPage({super.key});

  final controller = Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    final makanan = controller.makanan;

    return Scaffold(
      appBar: AppBar(title: Text("Transaksi Pembelian")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== DETAIL MAKANAN =====
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    makanan.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 200,
                      child: Center(child: Icon(Icons.fastfood, size: 80)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          makanan.namaMakanan,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          formatRupiah(makanan.hargaMakanan),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(makanan.deskripsi, style: TextStyle(height: 1.4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // ===== INPUT JUMLAH =====
            TextField(
              controller: controller.txtJumlah,
              keyboardType: TextInputType.number,
              // hanya boleh angka
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: "Jumlah Makanan",
                prefixIcon: Icon(Icons.shopping_basket_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),

            // ===== TOMBOL BAYAR =====
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: controller.bayar,
                icon: Icon(Icons.payment),
                label: Text("Bayar", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // ===== HASIL PERHITUNGAN =====
            Obx(() {
              if (controller.sudahBayar.value == false) {
                return SizedBox();
              }
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _baris("Subtotal", formatRupiah(controller.subtotal.value)),
                      _baris("PPN (5%)", formatRupiah(controller.ppn.value)),
                      Divider(),
                      _baris(
                        "Total Bayar",
                        formatRupiah(controller.totalBayar.value),
                        tebal: true,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _baris(String label, String nilai, {bool tebal = false}) {
    final gaya = TextStyle(
      fontSize: tebal ? 18 : 15,
      fontWeight: tebal ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: gaya),
          Text(nilai, style: gaya),
        ],
      ),
    );
  }
}

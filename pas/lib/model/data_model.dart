class DataModel {
  String namaMakanan;
  String deskripsi;
  String imageUrl;
  int hargaMakanan; // angka biasa (25000), supaya bisa dihitung di transaksi

  DataModel({
    required this.namaMakanan,
    required this.deskripsi,
    required this.imageUrl,
    required this.hargaMakanan,
  });
}

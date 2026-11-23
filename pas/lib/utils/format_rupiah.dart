String formatRupiah(num angka) {
  String teks = angka.round().toString();
  String hasil = "";
  int hitung = 0;
  for (int i = teks.length - 1; i >= 0; i--) {
    hasil = teks[i] + hasil;
    hitung++;
    if (hitung % 3 == 0 && i != 0) {
      hasil = ".$hasil";
    }
  }
  return "Rp$hasil";
}

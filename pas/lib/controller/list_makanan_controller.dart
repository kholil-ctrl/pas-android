
import 'package:pas/routes.dart';
import 'package:get/get.dart';
import 'package:pas/model/makanan_model.dart';

class ListMakananController extends GetxController {
  List<MakananModel> dataMakanan = [
    MakananModel(
      namaMakanan: "Wagyu Steak",
      harga: "185.000",
      gambar:
          "https://axwwgrkdco.cloudimg.io/v7/__gmpics3__/8cdd895dc54440fba3931b0056358c12.jpeg?width=1000",
      deskripsi:
          "Steak premium dengan tekstur lembut dan cita rasa kaya. "
          "Disajikan bersama saus spesial dan sayuran pilihan "
          "untuk pengalaman bersantap yang istimewa.",
    ),
    MakananModel(
      namaMakanan: "Poffertjes",
      harga: "220.000",
      gambar:
          "https://www.sternefresser.de/fileadmin/user_upload/koenigshof_2017/hummer.jpg",
      deskripsi:
          "pofercis biasa disajikan sebagai hidangan selamat datang"
          "dan sering dinikmati pada hari-hari spesial "
          "seperti festival musim panas, hari libur nasional, hingga Hari Raya Natal.",
    ),
    MakananModel(
      namaMakanan: "Truffle Cream Pasta",
      harga: "145.000",
      gambar:
          "https://axwwgrkdco.cloudimg.io/v7/__gmpics3__/4d27d5ca405a4733977bb945e1f5cd4e.jpeg",
      deskripsi:
          "Pasta dengan saus krim lembut dan aroma khas truffle. "
          "Perpaduan rasa gurih dan tekstur creamy dalam "
          "sajian bergaya restoran fine dining.",
    ),
    MakananModel(
      namaMakanan: "Kibbeling",
      harga: "125.000",
      gambar:
          "https://thumb.wikimedia.org/wikipedia/commons/thumb/8/88/2021-10-13-Kibbeling-4943.jpg/500px-2021-10-13-Kibbeling-4943.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail",
      deskripsi:
          "is a Dutch snack consisting of battered chunks of fish (traditionally cod) "
          "seasoned with a mix of spices and commonly served with remoulade or ravigote. ",
    ),
    MakananModel(
      namaMakanan: "Beef Wellington",
      harga: "195.000",
      gambar:
          "https://axwwgrkdco.cloudimg.io/v7/__gmpics3__/fc4720aca2494041ab963d16ff203042.jpg",
      deskripsi:
          "Hidangan daging sapi premium dengan inspirasi "
          "kuliner klasik Eropa. Disajikan dengan pelengkap "
          "dan saus gurih untuk pengalaman makan yang elegan.",
    ),
  ];

  void bukaDetail(MakananModel makanan) {
    Get.toNamed(
      Routes.detail_makanan,
      arguments: makanan,
    );
  }
}
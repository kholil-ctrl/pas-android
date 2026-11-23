import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas/pages/main_menu_page.dart';
import 'package:pas/pages/login_page.dart';
import 'package:pas/pages/detail_makanan_page.dart';

class Routes {
 static const String main_menu_page = "/main_menu_page";
 static const String login_page = "/login_page";
static const String detail_makanan = "/detail_makanan";

   static final myPages = [
    GetPage(name: main_menu_page, page: () => MainMenuPage()),
    GetPage(name: login_page, page: () => LoginPage()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
  ];

 

  
}

 
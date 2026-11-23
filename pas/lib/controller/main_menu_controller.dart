import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas/pages/main_menu_page.dart';
import 'package:pas/menu/feat_page.dart';
import 'package:pas/menu/home_page.dart';
import 'package:pas/menu/profile_page.dart';


class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [HomePage(), FeatPage(), ProfilePage()];
}
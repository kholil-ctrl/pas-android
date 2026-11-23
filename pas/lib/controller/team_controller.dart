import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas/model/team_model.dart';

class TeamController extends GetxController {
  var isLoading = false.obs;

  var premierLeagueModel = Rxn<PremierLeagueModel>();

  @override
  void onInit() {
    super.onInit();
    getTeam();
  }

  Future<void> getTeam() async {
    try {
      isLoading.value = true; 
      final url = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League",
      );

      final response = await http.get(url);

      isLoading.value = false;
      if (response.statusCode == 200) {
        premierLeagueModel.value = premierLeagueModelFromJson(response.body);
      } else {
        Get.snackbar("gagal", "cek internet connection");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("gagal", e.toString());
      debugPrint("error nya $e");
    }
  }
}
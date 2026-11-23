import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/team_controller.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("English Premier League")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // kalau data belum ada atau kosong, tampilkan tombol coba lagi
        if (controller.premierLeagueModel.value == null ||
            controller.premierLeagueModel.value!.teams.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Data tidak ditemukan"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.getTeam,
                  child: Text("Coba lagi"),
                ),
              ],
            ),
          );
        }

        final teams = controller.premierLeagueModel.value!.teams;

        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: teams.length,
          itemBuilder: (context, index) {
            final team = teams[index];
            return Card(
              elevation: 3,
              child: ListTile(
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    team.strBadge,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.sports_soccer, size: 40),
                  ),
                ),
                // nama klub (strTeam)
                title: Text(
                  team.strTeam,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // nama stadion (strStadium)
                subtitle: Text(team.strStadium),
              ),
            );
          },
        );
      }),
    );
  }
}
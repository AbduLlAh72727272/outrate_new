// controllers/leaderboard_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import '../models/leaderboard_model.dart';
import '../models/leadership_model.dart';

class LeaderboardController extends GetxController {
  var leaderboardList = <LeaderboardModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchLeaderboard();
    super.onInit();
  }

  Future<void> fetchLeaderboard() async {
    isLoading.value = true;

    final url = 'https://outrate-apis.vercel.app/api/v2/User/GetLeaderBoard';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      leaderboardList.value = jsonResponse
          .map((data) => LeaderboardModel.fromJson(data))
          .toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch leaderboard');
    }

    isLoading.value = false;
  }
}

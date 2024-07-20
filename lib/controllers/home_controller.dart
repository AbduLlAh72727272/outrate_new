import 'package:get/get.dart';
import '../models/feed_model.dart';
import '../services/home_service.dart'; // Import HomeService

class HomeController extends GetxController {
  var profiles = <FeedModel>[].obs;
  var isLoading = true.obs;
  late String token;
  late int userId;
  final HomeService _homeService = HomeService(); // Create an instance of HomeService

  void initialize(String token, int userId) {
    this.token = token;
    this.userId = userId;
    fetchProfiles();
  }

  Future<void> fetchProfiles() async {
    isLoading.value = true;

    try {
      profiles.value = await _homeService.fetchProfiles(token, userId);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

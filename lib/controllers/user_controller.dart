// controllers/user_controller.dart
import 'package:get/get.dart';
//import '../models/user_model.dart';
import '../models/user_model.dart';
//import '../view/user_model.dart';

class UserController extends GetxController {
  final RxString token = ''.obs;
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  void updateUser(UserModel newUser) {
    user.value = newUser;
  }
}

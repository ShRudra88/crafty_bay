import 'package:get/get.dart';

import 'auth_controller.dart';

class MainBottomNavController extends GetxController {
  int _selctedIndex = 0;

  int get currentIndex => _selctedIndex;

  void changeIndex(int index) {
    if (index == _selctedIndex) {
      return;
    }
    if (index == 2 || index == 3) {
      if (Get.find<AuthController>().isTokenNotNull == false) {
        AuthController.goToLogin();
        return;
      }
    }
  }

  void backToHome() {
    changeIndex(0);
  }
}

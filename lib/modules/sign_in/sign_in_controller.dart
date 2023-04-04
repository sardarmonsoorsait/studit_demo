
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:studit/modules/home/home_page.dart';

import '../../api_repository/api_repository.dart';







class LoginController extends GetxController with StateMixin {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  void getLogin()  {
    bool isLoggedIn;
  
      change(null, status: RxStatus.loading());
      isLoggedIn =  ApiRepository.login(
          emailEditingController.text.trim(),
          passwordEditingController.text.trim());
   

    if (isLoggedIn) {
      Get.off(HomePage());
      change(null, status: RxStatus.success());
    } else {
      Get.snackbar('Alert',
          'Somthing went wrong Enter an approved Email and correct password');

      change(null, status: RxStatus.error());
    }
  }
}

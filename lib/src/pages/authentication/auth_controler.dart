import 'package:get/get.dart';

class authControlhe extends GetxController {
  RxBool isloading = false.obs;

  Future<void> singIn({required String email, required String password}) async {
    isloading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isloading.value = false;
  }
}

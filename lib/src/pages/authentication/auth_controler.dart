import 'package:get/get.dart';
import 'package:grocerstore/src/pages/authentication/repository/auth_repository.dart';

class authControlhe extends GetxController {
  RxBool isloading = false.obs;
  final authRepository = AuthRepository();

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    isloading.value = true;
    await authRepository.signIn(
      email: email,
      password: password,
    );
    isloading.value = false;
  }
}

import 'package:get/get.dart';
import 'package:grocerstore/src/models/user_model.dart';
import 'package:grocerstore/src/pages/authentication/repository/auth_repository.dart';
import 'package:grocerstore/src/pages/authentication/result/auth_result.dart';
import 'package:grocerstore/src/pages_routes/app_page_routes.dart';
import 'package:grocerstore/src/services/utils_services.dart';

class authControlhe extends GetxController {
  RxBool isloading = false.obs;
  final authRepository = AuthRepository();
  final utilsSerives = UtilsServices();
  UserModel user = UserModel();

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    isloading.value = true;
    AuthResult result =
        await authRepository.signIn(email: email, password: password);
    isloading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PageRoutesName.BaseScreen);
      },
      error: (menssage) {
        utilsSerives.showToast(message: menssage, isError: true);
      },
    );
  }
}

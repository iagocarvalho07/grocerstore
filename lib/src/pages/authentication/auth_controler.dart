import 'package:get/get.dart';
import 'package:grocerstore/src/models/user_model.dart';
import 'package:grocerstore/src/pages/authentication/repository/auth_repository.dart';
import 'package:grocerstore/src/pages/authentication/result/auth_result.dart';
import 'package:grocerstore/src/pages_routes/app_page_routes.dart';
import 'package:grocerstore/src/services/utils_services.dart';

import '../../config/constants/store_keys.dart';

class authControlhe extends GetxController {
  RxBool isloading = false.obs;
  final authRepository = AuthRepository();
  final utilsSerives = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit(){
    super.onInit();
    validateToken();
  }

  Future<void> validateToken() async {
    // reccuperar token que foi salvo localmente
    String? token = await utilsSerives.getLocalData(key: Storagekeys.token);
    if (token == null) {
      Get.offAllNamed(PageRoutesName.SingInScreen);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);
    result.when(
      success: (user) {
        SaveTokenAndProceedTobase();
      },
      error: (error) {
        SingOut();
      },
    );
  }

  Future<void> SingOut() async {
    // Zerar o user
    user = UserModel();
    // remover o token localmente
    await utilsSerives.removeLocalData(key: Storagekeys.token);
    // ir para o login
    Get.offAllNamed(PageRoutesName.SingInScreen);
  }

  void SaveTokenAndProceedTobase() {
    // salvar o token
    utilsSerives.saveLocalDate(key: Storagekeys.token, data: user.token!);
    // ir para tela Base
    Get.offAllNamed(PageRoutesName.BaseScreen);
  }

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
        SaveTokenAndProceedTobase();
      },
      error: (menssage) {
        utilsSerives.showToast(message: menssage, isError: true);
      },
    );
  }
}

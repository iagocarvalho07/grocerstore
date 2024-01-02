import 'package:grocerstore/src/config/constants/end_points.dart';
import 'package:grocerstore/src/models/user_model.dart';
import 'package:grocerstore/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (result['result'] != null) {
      print("o login funcionol");
      final user = UserModel.fromMap(result['result']);
      print(user.token);
    } else {
      print("ñao deu certo o login");
    }
  }
}

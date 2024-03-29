import 'package:grocerstore/src/config/constants/end_points.dart';
import 'package:grocerstore/src/models/user_model.dart';
import 'package:grocerstore/src/pages/authentication/repository/auth_errors.dart';
import 'package:grocerstore/src/pages/authentication/result/auth_result.dart';
import 'package:grocerstore/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(AuthErrorString(result['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: EndPoints.validateToken,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token});
    return handleUserOrError(result);
  }

  Future<AuthResult> signIn({
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
    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager
        .restRequest(url: EndPoints.signUp, method: HttpMethods.post, body: user.toJson());
    return handleUserOrError(result);
  }
}

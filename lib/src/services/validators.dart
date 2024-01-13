import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Digite Seu Email";
  }
  if (!email.isEmail) return "Digite Um Email valido";
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return "Digite Seu Senha";
  }
  if (password.length <= 7) {
    return "A Senha deve Conter Pelomenos 7 caracteres";
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return "Difite um Nome!";
  }
  if (name.length < 3 || name.length > 15) {
    return 'O nome Deve conter Entre 3 a 15 Caracteres';
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return "Difite um Nome!";
  }
  if (!phone.isPhoneNumber) return "Digite um Numero Valido";
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return "Digite um CPF";
  }
  if (!cpf.isCpf) return "Digite um CPF Valido";
  return null;
}

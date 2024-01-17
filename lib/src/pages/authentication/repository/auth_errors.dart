String AuthErrorString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';
    case "Invalid session token":
      return 'Token Invalido';
    case 'INVALID_FULLNAME':
        return 'OCORREU UM ERRO AO CADASTRAR USUARIO: NOME INVALIDO';
    case 'INVALID_PHONE':
      return 'OCORREU UM ERRO AO CADASTRAR USUARIO: Celular INVALIDO';
    case 'INVALID_CPF':
      return 'OCORREU UM ERRO AO CADASTRAR USUARIO: CPF INVALIDO';
    default:
      return "Error Desconhecido";
  }
}

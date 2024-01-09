String AuthErrorString(String? code) {
  switch (code) {
    case 'IMVALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';
    case "Invalid session token":
      return 'Token Invalido';
    default:
      return "Error Desconhecido";
  }
}

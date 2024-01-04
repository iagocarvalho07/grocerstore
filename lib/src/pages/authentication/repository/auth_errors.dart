String AuthErrorString(String? code) {
  switch (code) {
    case 'IMVALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';
    default:
      return "Error Desconhecido";
  }
}

class Validators {
  // Epostanın geçerli olup olmadığını kontrol eder.
  static bool isValidEmail(String email) {
    // Geçerli bir e-posta adresi için düzenli ifade
    String pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}

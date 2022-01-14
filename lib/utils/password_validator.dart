
class CredentialsValidator {
  final RegExp _pattern = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  final RegExp _emailPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool isPasswordValid(String? password) {
    return password == null ? false : (_pattern.hasMatch(password) ? true : false);
  }
  bool isNewPasswordValid({required String oldPassword, required String newPassword}) {
    return isPasswordValid(newPassword) && oldPassword.compareTo(newPassword) != 0;
  }
  bool isConfirmedPasswordValid({required String newPassword, required String confirmedPassword}) {
    return newPassword.compareTo(confirmedPassword) == 0;
  }

  bool isEmailValid({required String email}) {
    return _emailPattern.hasMatch(email);
  }


}
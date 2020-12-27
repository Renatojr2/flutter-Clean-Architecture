abstract class LoginPresenter {
  Stream get emailErrorStream;
  Stream get passwordErrorStream;
  Stream get isFormValidErrorStream;

  void validateEmail(String email);
  void validatePassword(String email);
}

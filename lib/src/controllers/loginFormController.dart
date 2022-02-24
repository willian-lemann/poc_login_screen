class LoginFormController {
  String email;
  String password;
  bool showPassword;
  bool isEmptyFields;

  LoginFormController({
    this.email = '',
    this.password = '',
    this.showPassword = false,
    this.isEmptyFields = true,
  });
  
}

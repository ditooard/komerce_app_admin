class PasswordChange {
  String current_password;
  String new_password;
  String confirm_password;

  PasswordChange({
    required this.current_password,
    required this.new_password,
    required this.confirm_password,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': current_password,
      'new_password': new_password,
      'confirm_password': confirm_password,
    };
  }
}

class VerifyEmail {
  String email;

  VerifyEmail({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

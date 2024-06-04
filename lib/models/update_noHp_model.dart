class UpdateNoHp {
  String email;
  String noHp;

  UpdateNoHp({
    required this.email,
    required this.noHp,
  });

  factory UpdateNoHp.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UpdateNoHp(
      email: data['email'],
      noHp: data['no Hp'],
    );
  }
}

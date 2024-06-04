class User {
  int id;
  String email;
  String nama_lengkap;
  String username;
  String divisi;
  String no_hp;
  String jenis_kelamin;
  String alamat;
  String token;

  User(
      {this.id = 0,
      this.email = "",
      this.token = "",
      this.nama_lengkap = "",
      this.username = "",
      this.divisi = "",
      this.no_hp = "",
      this.jenis_kelamin = "",
      this.alamat = ""});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      token: json['token'],
      nama_lengkap: json['nama_lengkap'],
      username: json['username'],
      divisi: json['divisi'],
      no_hp: json['no_hp'],
      jenis_kelamin: json['jenis_kelamin'],
      alamat: json['alamat'],
    );
  }
}

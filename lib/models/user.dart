class User {
  String id;
  String nama;
  String email;
  String jk;
  String noHP;

  User(this.id, this.nama, this.email, this.jk, this.noHP);

  User.fromJson(Map json)
      : id = json['id'].toString(),
        nama = json['nama'],
        email = json['email'],
        jk = json['jk'],
        noHP = json['no_hp'].toString();
}

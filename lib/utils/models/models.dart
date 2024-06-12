class User extends DropDownModel {
  int id = 0;
  String nazwa = '';
  String username = '';
  String email = '';

  @override
  int? get dajId => id;
  @override
  String? get dajNazwa => nazwa;

  User({
    required this.id,
    required this.nazwa,
    required this.username,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        nazwa = json['name'] ?? '',
        username = json['username'] ?? '',
        email = json['email'] ?? '';
}

abstract class DropDownModel {
  String? get dajNazwa;
  int? get dajId;
}

class Post {
  int userId = 0;
  int id = 0;
  String title = "";
  String body = "";

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] ?? 0,
        id = json['id'] ?? 0,
        title = json['title'] ?? '',
        body = json['body'] ?? '';
}

class User extends DropDownModel {
  int? id;
  String? nazwa;
  String? username;
  String? email;

  @override
  int? get dajId => id;
  @override
  String? get dajNazwa => nazwa;

  User({this.id, this.nazwa, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nazwa = json['name'];
    username = json['username'];
    email = json['email'];
  }
}

abstract class DropDownModel {
  String? get dajNazwa;
  int? get dajId;
}

class Post extends DropDownModel {
  int? albumId;
  int? id;
  String? nazwa;
  String? url;
  String? thumbnailUrl;

  @override
  int? get dajId => id;
  @override
  String? get dajNazwa => nazwa;

  Post({this.albumId, this.id, this.nazwa, this.url, this.thumbnailUrl});

  Post.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    nazwa = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}

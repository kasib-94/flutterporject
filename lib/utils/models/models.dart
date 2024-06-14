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

class Comment {
  int postId = 0;
  int id = 0;
  String name = "";
  String email = "";
  String body = "";

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.body,
    required this.email,
  });

  Comment.fromJson(Map<String, dynamic> json)
      : email = json['email'] ?? 0,
        id = json['id'] ?? 0,
        name = json['name'] ?? '',
        body = json['body'] ?? '',
        postId = json['postId'] ?? '';
}

class Album {
  int userId = 0;
  int id = 0;
  String title = "";

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  Album.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] ?? 0,
        id = json['id'] ?? 0,
        title = json['title'] ?? '';
}

class Photo {
  int albumId = 0;
  int id = 2;
  String title = "";
  String url = "";
  String thumbnailUrl = "";

  Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json)
      : albumId = json['userId'] ?? 0,
        id = json['id'] ?? 0,
        title = json['title'] ?? '',
        url = json['url'] ?? 0,
        thumbnailUrl = json['thumbnailUrl'] ?? '';
}

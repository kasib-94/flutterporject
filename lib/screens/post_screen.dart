import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final int postId;

  const PostScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {}

  // Future<List<Post>> fetchPosts() async {
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/?userId=${widget.selectedUserId}');
  //   final response = await http.get(url, headers: {"Content-Type": "application/json"});

  //   if (response.statusCode == 200) {
  //     final List<dynamic> body = json.decode(response.body);
  //     return body.map((e) => Post.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Błąd!!');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("witam"),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterporject/screens/albums_screen.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:flutterporject/widgets/loading_Scaffold.dart';
import 'package:http/http.dart' as http;
import 'package:flutterporject/widgets/post.dart';

class UserScreen extends StatefulWidget {
  final int selectedUserId;

  const UserScreen({Key? key, required this.selectedUserId}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User user = new User(id: 0, nazwa: "nazwa", username: "username", email: "email");

  @override
  void initState() {
    super.initState();
    fetchUsers().then((fetchedUser) {
      setState(() {
        user = fetchedUser;
      });
    });
  }

  Future<List<Post>> fetchPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/?userId=${widget.selectedUserId}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Błąd!!');
    }
  }

  Future<User> fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/${widget.selectedUserId}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return User.fromJson(body);
    } else {
      throw Exception('Błąd!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return user != null ? buildUserScaffold(context) : buildLoadingScaffold(context);
  }

  Widget buildUserScaffold(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlbumScreen(
                              user: user,
                            )),
                  );
                },
                child: const Text('Go to albums'),
              ),
            ),
          ],
          title: Row(
            children: [
              const Icon(Icons.person),
              Text('Witaj, ${user!.email}'),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder<List<Post>>(
            future: fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: buildLoadingScaffold(context));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PostWidget(post: snapshot.data![index]);
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Brak danych',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
              } else {
                return const Center(
                  child: Text(
                    'Wystąpił błąd spróbuj',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            }));
  }
}

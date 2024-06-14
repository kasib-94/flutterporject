import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:http/http.dart' as http;

class Comments extends StatefulWidget {
  final int postId;

  const Comments({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Future<List<Comment>> fetchComments() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments/?postId=${widget.postId}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => Comment.fromJson(e)).toList();
    } else {
      throw Exception('Błąd!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comment>>(
        future: fetchComments(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true, // Add this to limit ListView height
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              snapshot.data![index].email,
                              style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              snapshot.data![index].body,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ));
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
                'Wystąpił błąd, spróbuj ponownie',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        }));
  }
}

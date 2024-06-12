import 'package:flutter/material.dart';
import 'package:flutterporject/screens/post_screen.dart';
import 'package:flutterporject/utils/models/models.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8.0, right: 30, left: 30),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 8),
            Row(children: [
              Text(post.body),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostScreen(
                                postId: post.id,
                              )),
                    );
                  },
                  icon: const Icon(Icons.arrow_right_sharp))
            ]),
          ],
        ),
      ),
    );
  }
}

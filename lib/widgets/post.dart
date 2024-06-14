import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:flutterporject/widgets/comments.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);
  @override
  _PostWidget createState() => _PostWidget();
}

class _PostWidget extends State<PostWidget> {
  bool showComments = false;

  void changeshowComments(bool value) {
    setState(() {
      showComments = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        margin: const EdgeInsets.only(top: 8.0, right: 30, left: 30),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                widget.post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(height: 8),
              Center(
                  child: Row(children: [
                Text(widget.post.body),
                const Spacer(flex: 1),
                Switch(
                    value: showComments,
                    onChanged: (value) {
                      changeshowComments(value);
                    })
              ])),
            ],
          ),
        ),
      ),
      showComments ? Comments(postId: widget.post.id) : const SizedBox.shrink()
    ]);
  }
}

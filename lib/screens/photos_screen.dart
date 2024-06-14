import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:flutterporject/widgets/loading_Scaffold.dart';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  final User user;
  final int albumId;
  const PhotoScreen({Key? key, required this.user, required this.albumId}) : super(key: key);

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  Future<List<Photo>> fetchPhotos() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/?albumId=${widget.albumId}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => Photo.fromJson(e)).toList();
    } else {
      throw Exception('Błąd!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.person),
              Text('Witaj, ${widget.user.email}'),
            ],
          ),
        ),
        body: FutureBuilder<List<Photo>>(
            future: fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: buildLoadingScaffold(context));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        return Card(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(
                                snapshot.data![index].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ));
                      });
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';
import 'package:flutterporject/widgets/loading_Scaffold.dart';
import 'package:http/http.dart' as http;

class AlbumScreen extends StatefulWidget {
  final User user;
  const AlbumScreen({Key? key, required this.user}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  Future<List<Album>> fetchAlbums() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums/?userId=${widget.user.id}');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => Album.fromJson(e)).toList();
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder<List<Album>>(
            future: fetchAlbums(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: buildLoadingScaffold(context));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 4,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {},
                              child: Card(
                                child: Center(
                                  child: Text(item.title),
                                ),
                              )),
                        );
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

import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final String id;
  final String text;

  Post({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
      };
}

Future<List<Post>> getAllPosts() async {
  List<Post> posts = [];
  try {
    final response = await http.get(Uri.http("localhost:8000", "posts"));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    posts = decodedJson
        .map((e) => Post(
              id: e["id"],
              text: e["text"],
            ))
        .toList();
  } catch (e) {
    print(e);
  }

  return posts;
}

Future<void> deletePost(String id) async {
  try {
    await http.delete(Uri.http("localhost:8000", "posts/$id"));
  } catch (e) {
    print(e);
  }
}

Future<void> createPost({
  required String text,
}) async {
  final post = Post(
    id: "",
    text: text,
  );
  try {
    final encodedJson = jsonEncode(post);
    await http.post(Uri.http("localhost:8000", "posts"), body: encodedJson);
  } catch (e) {
    print(e);
  }
}

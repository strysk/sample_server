import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final localHostDataSource =
    Provider<LocalHostDataSource>((ref) => LocalHostDataSource());

class LocalHostDataSource {
  Future<http.Response?> fetchAllPosts() async {
    try {
      return await http.get(Uri.http("localhost:8000", "posts"));
    } catch (e) {
      print(e);
      return null;
    }
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
    try {
      final encodedJson = jsonEncode({"id": "", "text": text});
      await http.post(Uri.http("localhost:8000", "posts"), body: encodedJson);
    } catch (e) {
      print(e);
    }
  }
}

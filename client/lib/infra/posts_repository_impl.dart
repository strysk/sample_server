import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/entity/post.dart';
import '../domain/repository/posts_repository.dart';
import 'local_host_data_source.dart';

final postsRepositoryImplProvider = Provider<PostsRepositoryImpl>((ref) =>
    PostsRepositoryImpl(localHostDataSource: ref.read(localHostDataSource)));

class PostsRepositoryImpl implements PostsRepository {
  final LocalHostDataSource _localHostDataSource;

  PostsRepositoryImpl({required LocalHostDataSource localHostDataSource})
      : _localHostDataSource = localHostDataSource;

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await _localHostDataSource.fetchAllPosts();

    if (response == null) return [];

    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((e) => Post(
              id: e["id"],
              text: e["text"],
            ))
        .toList();
  }

  @override
  Future<void> addPost({required String text}) async {
    await _localHostDataSource.createPost(text: text);
  }

  @override
  Future<void> deletePost({required String id}) async {
    await _localHostDataSource.deletePost(id);
  }
}

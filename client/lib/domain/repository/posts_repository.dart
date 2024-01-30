import '../entity/post.dart';

abstract class PostsRepository {
  Future<List<Post>> fetchPosts();

  Future<void> addPost({required String text});

  Future<void> deletePost({required String id});
}

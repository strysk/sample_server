import '../entity/post.dart';
import '../repository/posts_repository.dart';

class GetPostsUseCase {
  final PostsRepository _postsRepository;

  GetPostsUseCase({required PostsRepository postsRepository})
      : _postsRepository = postsRepository;

  Future<List<Post>> call() async {
    return await _postsRepository.fetchPosts();
  }
}

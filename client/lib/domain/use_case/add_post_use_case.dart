import '../repository/posts_repository.dart';

class AddPostUseCase {
  final PostsRepository _postsRepository;

  AddPostUseCase({required PostsRepository postsRepository})
      : _postsRepository = postsRepository;

  Future<void> call({required String text}) async {
    return await _postsRepository.addPost(text: text);
  }
}

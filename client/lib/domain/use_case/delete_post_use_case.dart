import '../repository/posts_repository.dart';

class DeletePostUseCase {
  final PostsRepository _postsRepository;

  DeletePostUseCase({required PostsRepository postsRepository})
      : _postsRepository = postsRepository;

  Future<void> call({required String id}) async {
    return await _postsRepository.deletePost(id: id);
  }
}

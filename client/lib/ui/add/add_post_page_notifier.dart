import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../di/use_case_provider.dart';
import '../../domain/use_case/add_post_use_case.dart';

final addPostListPageControllerProvider = Provider<AddPostListPageController>(
    (ref) => AddPostListPageController(
        addPostUseCase: ref.read(addPostUseCaseProvider)));

class AddPostListPageController {
  final AddPostUseCase _addPostUseCase;

  AddPostListPageController({required AddPostUseCase addPostUseCase})
      : _addPostUseCase = addPostUseCase;

  Future<void> addPost({required String text}) async {
    await _addPostUseCase(text: text);
  }
}

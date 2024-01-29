import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../di/use_case_provider.dart';
import '../../domain/entity/post.dart';

part 'post_list_page_notifier.freezed.dart';
part 'post_list_page_notifier.g.dart';

@freezed
class PostListPageData with _$PostListPageData {
  factory PostListPageData({
    required List<Post> posts,
  }) = _PostListPageData;
}

@riverpod
class AsyncPostListPageData extends _$AsyncPostListPageData {
  @override
  FutureOr<List<Post>> build() async {
    return _fetchPostList();
  }

  Future<List<Post>> _fetchPostList() async {
    final getPostsUseCase = ref.read(getPostsUseCaseProvider);
    return await getPostsUseCase();
  }

  Future<void> deletePost({required String id}) async {
    final deletePostUseCase = ref.read(deletePostUseCaseProvider);
    await deletePostUseCase(id: id);
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/use_case/add_post_use_case.dart';
import '../domain/use_case/delete_post_use_case.dart';
import '../domain/use_case/get_posts_use_case.dart';
import '../infra/posts_repository_impl.dart';

final getPostsUseCaseProvider = Provider<GetPostsUseCase>((ref) =>
    GetPostsUseCase(postsRepository: ref.read(postsRepositoryImplProvider)));

final addPostUseCaseProvider = Provider<AddPostUseCase>((ref) =>
    AddPostUseCase(postsRepository: ref.read(postsRepositoryImplProvider)));

final deletePostUseCaseProvider = Provider<DeletePostUseCase>((ref) =>
    DeletePostUseCase(postsRepository: ref.read(postsRepositoryImplProvider)));

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../add/add_post_page.dart';
import 'post_list_page_notifier.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(asyncPostListPageDataProvider);

    return asyncValue.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("一覧"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return const AddPostPage();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(data[index].text),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref
                      .read(asyncPostListPageDataProvider.notifier)
                      .deletePost(id: data[index].id);
                },
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
      error: (_, __) => Container(),
      loading: () => Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'add_post_page_notifier.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final controller = ref.read(addPostListPageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("投稿"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: textController,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                controller.addPost(text: textController.text);
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.post_add),
            ),
          ],
        ),
      ),
    );
  }
}

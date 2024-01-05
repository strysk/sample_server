import 'package:flutter/material.dart';
import 'package:sample_server/ui/AddPostPage.dart';

import '../model/post.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<StatefulWidget> createState() => PostListPageState();
}

class PostListPageState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() {
            setState(() {});
          });
        },
        child: FutureBuilder<List<Post>>(
          future: getAllPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            final data = snapshot.data;
            if (data == null) return Container();

            return ListView.builder(
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(data[index].text),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deletePost(data[index].id);
                    },
                  ),
                );
              },
              itemCount: data.length,
            );
          },
        ),
      ),
    );
  }
}

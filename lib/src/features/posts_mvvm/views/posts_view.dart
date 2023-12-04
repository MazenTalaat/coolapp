import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_api.dart';
import 'package:coolapp/src/features/posts_mvvm/view_models/posts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coolapp/generated/l10n.dart';

class PostsView extends ConsumerWidget {
  PostsView({Key? key}) : super(key: key);
  var postsViewModel = PostsViewModel(postsRepository: PostsAPI());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenDimensions = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(S.of(context).all_posts),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenDimensions.width,
                height: screenDimensions.height / 2,
                child: Center(
                  child: FutureBuilder<List<Posts>>(
                    future: postsViewModel.fetchAllPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        var posts = snapshot.data;
                        return ListView.builder(
                          itemCount: posts?.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(posts![index].title ?? '---', textDirection: TextDirection.ltr),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

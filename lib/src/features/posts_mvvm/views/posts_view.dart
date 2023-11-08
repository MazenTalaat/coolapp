import 'package:coolapp/src/core/app_router.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_api.dart';
import 'package:coolapp/src/features/posts_mvvm/view_models/posts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';

class PostsView extends ConsumerWidget {
  PostsView({Key? key}) : super(key: key);
  var postsViewModel = PostsViewModel(postsRepository: PostsAPI());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenDimensions = MediaQuery.of(context).size;
    var status = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenDimensions.width,
              height: screenDimensions.height/2,
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
                          title: Text(posts![index].title??'---'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            // TextButton(
            //   child: const Text('Load data'),
            //   onPressed: () {
            //     postsViewModel.fetchAllPosts();
            //   },
            // ),
            TextButton(
              onPressed: status.isLoading
                  ? null
                  : () {
                      ref.read(authControllerProvider.notifier).signOut();
                      context.goNamed(AppRoute.auth.name);
                    },
              child: status.isLoading
                  ? JumpingDots(
                      color: Colors.black,
                      radius: 7,
                      numberOfDots: 3,
                      animationDuration: const Duration(milliseconds: 200),
                      verticalOffset: -10,
                    )
                  : const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

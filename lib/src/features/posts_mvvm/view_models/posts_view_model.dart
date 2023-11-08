import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_repository.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepository? postsRepository;

  PostsViewModel({this.postsRepository});

  Future<List<Posts>> fetchAllPosts() async {
    var listOfPosts = await postsRepository!.getAllPosts();
    return listOfPosts;
  }
}

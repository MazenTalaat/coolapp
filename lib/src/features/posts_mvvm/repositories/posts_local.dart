import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_repository.dart';

class PostsLocal extends PostsRepository {
  @override
  Future<List<Posts>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Posts> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

}
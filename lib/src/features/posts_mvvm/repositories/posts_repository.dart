import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';

abstract class PostsRepository{
  Future<List<Posts>> getAllPosts();
  Future<Posts> getPostById(int id);
}
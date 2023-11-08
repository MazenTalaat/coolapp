import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_repository.dart';
import 'package:dio/dio.dart';

class PostsAPI extends PostsRepository {
  @override
  Future<List<Posts>> getAllPosts() async {
    List<Posts> posts = [];
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      var list = response.data as List;
      posts = list.map((post) => Posts.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }
    return posts;
  }

  @override
  Future<Posts> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}

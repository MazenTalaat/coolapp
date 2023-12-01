import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepository? postsRepository;

  PostsViewModel({this.postsRepository});

  Future<List<Posts>> fetchAllPosts() async {
    var listOfPosts = await postsRepository!.getAllPosts();
    return listOfPosts;
  }

  Future<String> getFromSharedPreference() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? logged = prefs.getBool('loggedIn');
    final String? email = prefs.getString('email');
    final String? loginType = prefs.getString('loginType');

    return 'isLogged? $logged, email: $email, loginType: $loginType';
  }
}

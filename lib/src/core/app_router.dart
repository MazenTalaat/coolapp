import 'package:coolapp/src/features/auth_mvc/views/auth_view.dart';
import 'package:coolapp/src/features/posts_mvvm/views/posts_view.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { auth, sigUp, posts }

final goRouter = GoRouter(
  initialLocation: '/posts',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/auth',
      name: AppRoute.auth.name,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/posts',
      name: AppRoute.posts.name,
      builder: (context, state) => PostsView(),
    ),
  ],
);

import 'package:coolapp/src/features/auth_mvc/views/auth_success_screen.dart';
import 'package:coolapp/src/features/auth_mvc/views/auth_view.dart';
import 'package:coolapp/src/features/intro/views/intro_view.dart';
import 'package:coolapp/src/features/posts_mvvm/views/posts_view.dart';
import 'package:coolapp/src/features/register_mvc/views/register_view.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { intro, auth, authSuccess, register, posts }

final goRouter = GoRouter(
  initialLocation: '/intro',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/intro',
      name: AppRoute.intro.name,
      builder: (context, state) => const IntroView(),
      routes: [
        GoRoute(
          path: 'auth',
          name: AppRoute.auth.name,
          builder: (context, state) => const AuthView(),
          routes: [
            GoRoute(
              path: 'auth_success',
              name: AppRoute.authSuccess.name,
              builder: (context, state) => const AuthSuccessView(),
            ),
            GoRoute(
              path: 'register',
              name: AppRoute.register.name,
              builder: (context, state) => const RegisterView(),
            ),
          ],
        ),
        GoRoute(
          path: 'posts',
          name: AppRoute.posts.name,
          builder: (context, state) => PostsView(),
        ),
      ],
    ),
  ],
);

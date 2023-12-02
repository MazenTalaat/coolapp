import 'package:coolapp/core/app_router.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IntroView extends ConsumerWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to the cool app"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (ref.watch(authControllerProvider.notifier).isLogged()) {
                    debugPrint('Logged In');
                    context.goNamed(AppRoute.authSuccess.name);
                  } else {
                    context.goNamed(AppRoute.auth.name);
                  }
                },
                child: const Text("Login Page"),
              ),
              FilledButton(
                onPressed: () {
                  context.goNamed(AppRoute.posts.name);
                },
                child: const Text("API Call Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

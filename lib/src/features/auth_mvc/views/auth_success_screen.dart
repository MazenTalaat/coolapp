import 'package:coolapp/core/app_router.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';

class AuthSuccessView extends ConsumerWidget {
  const AuthSuccessView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var status = ref.watch(authControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Logged In!"),
          leading: IconButton(
              onPressed: () {
                context.goNamed(AppRoute.intro.name);
              },
              icon: const Icon(Icons.home)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Data from shared preference"),
              Text(
                ref
                    .watch(authControllerProvider.notifier)
                    .getFromSharedPreference(),
              ),
              TextButton(
                onPressed: status.isLoading
                    ? null
                    : () {
                        ref.invalidate(authControllerProvider);
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
      ),
    );
  }
}

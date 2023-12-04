import 'package:coolapp/core/app_router.dart';
import 'package:coolapp/core/theme/theme_provider.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IntroView extends ConsumerWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Center(child: Text("Welcome to the cool app")),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Theme"),
                  Switch(
                    value: appThemeState.isDarkModeEnabled,
                    onChanged: (isDark) {
                      if (isDark) {
                        appThemeState.setDarkTheme();
                      } else {
                        appThemeState.setLightTheme();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

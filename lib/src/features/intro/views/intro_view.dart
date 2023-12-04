import 'package:coolapp/core/app_router.dart';
import 'package:coolapp/core/locale_provider.dart';
import 'package:coolapp/core/theme/theme_provider.dart';
import 'package:coolapp/generated/l10n.dart';
import 'package:coolapp/src/features/auth_mvc/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:coolapp/generated/l10n.dart';

class IntroView extends ConsumerWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    final appLocaleState = ref.watch(appLocaleStateNotifier);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Center(child: Text(S.of(context).title)),
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
                child: Text(S.of(context).login_page),
              ),
              FilledButton(
                onPressed: () {
                  context.goNamed(AppRoute.posts.name);
                },
                child: Text(S.of(context).api_call_page),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).theme),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).lang),
                  Switch(
                    value: appLocaleState.lang == 'en',
                    onChanged: (isEn) {
                      if (isEn) {
                        appLocaleState.setLocale('en');
                      } else {
                        appLocaleState.setLocale('ar');
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

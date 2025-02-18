import 'package:coolapp/core/locale_provider.dart';
import 'package:coolapp/core/locator.dart';
import 'package:coolapp/core/theme/theme.dart';
import 'package:coolapp/core/theme/theme_provider.dart';
import 'package:coolapp/old_pages/home_page.dart';
import 'package:coolapp/old_pages/profile_page.dart';
import 'package:coolapp/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await locatorSetup();
  runApp(const ProviderScope(child: TestApp()));
}

class TestApp extends ConsumerWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: goRouter,
      // debugShowCheckedModeBanner: false,
      theme: ref.watch(appThemeStateNotifier).isDarkModeEnabled
          ? darkMode
          : lightMode,
      locale: Locale(ref.watch(appLocaleStateNotifier).lang),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       locale: const Locale('en'),
//       localizationsDelegates: const [
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: S.delegate.supportedLocales,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const RootPage(),
//     );
//   }
// }
//
// class RootPage extends StatefulWidget {
//   const RootPage({Key? key}) : super(key: key);
//
//   @override
//   State<RootPage> createState() => _RootPageState();
// }
//
// class _RootPageState extends State<RootPage> {
//   void changeLanguage() {
//     setState(() {
//       S.load(const Locale('ar'));
//     });
//   }
//
//   int currentPage = 0;
//   List<Widget> pages = const [HomePage(), ProfilePage()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).title),
//       ),
//       body: pages[currentPage],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           debugPrint('$currentPage');
//           changeLanguage();
//         },
//         child: const Icon(Icons.add),
//       ),
//       bottomNavigationBar: NavigationBar(
//         destinations: [
//           NavigationDestination(
//               icon: const Icon(Icons.dashboard),
//               label: 'S.of(context).dashboard'),
//           NavigationDestination(
//               icon: const Icon(Icons.class_), label: 'S.of(context).classes')
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         selectedIndex: currentPage,
//       ),
//     );
//   }
// }

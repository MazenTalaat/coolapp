import 'package:coolapp/src/features/auth_mvc/repositories/auth_fake.dart';
import 'package:coolapp/src/features/auth_mvc/repositories/auth_firebase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> locatorSetup() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPrefs);

  locator.registerLazySingleton<AuthFake>(() => AuthFake());
  locator.registerLazySingleton<AuthFirebase>(() => AuthFirebase());
}

import 'package:coolapp/src/features/auth_mvc/repositories/auth_local.dart';
import 'package:coolapp/src/features/auth_mvc/repositories/auth_firebase.dart';
import 'package:coolapp/src/features/register_mvc/repositories/register_firebase.dart';
import 'package:coolapp/src/features/register_mvc/repositories/register_local.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> locatorSetup() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPrefs);

  locator.registerLazySingleton<AuthLocal>(() => AuthLocal());
  locator.registerLazySingleton<AuthFirebase>(() => AuthFirebase());

  locator.registerLazySingleton<RegisterLocal>(() => RegisterLocal());
  locator.registerLazySingleton<RegisterFirebase>(() => RegisterFirebase());
}

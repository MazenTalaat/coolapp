import 'package:coolapp/src/features/auth_mvc/repositories/auth_fake.dart';
import 'package:coolapp/src/features/auth_mvc/repositories/auth_firebase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void locatorSetup() {
  locator.registerLazySingleton<AuthFake>(() => AuthFake());
  locator.registerLazySingleton<AuthFirebase>(() => AuthFirebase());
}

import 'di.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  _setupExternalServices();
  _setupAuthFeature();
}

void _setupAuthFeature() {
  injector.registerFactory<AuthCubit>(
    () => AuthCubit(injector<AuthRepo>()),
  );

  injector.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(injector<AuthRemoteDataSource>()),
  );

  injector.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDatasourceImpl(
      injector<AuthService>(),
    ),
  );
}

void _setupExternalServices() {
  injector.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(),
  );
}

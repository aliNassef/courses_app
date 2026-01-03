import 'package:courses_app/features/courses/data/source/courses_remote_datasource.dart';

import '../../features/courses/data/repo/courses_repo.dart';
import '../../features/courses/data/repo/courses_repo_impl.dart';
import '../../features/courses/presentation/view_model/courses_cubit/courses_cubit.dart';
import 'di.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  _setupExternalServices();
  _setupAuthFeature();
  _setupCoursesFeature();
}

void _setupCoursesFeature() {
  injector.registerFactory<CoursesCubit>(
    () => CoursesCubit(injector<CoursesRepo>()),
  );

  injector.registerLazySingleton<CoursesRepo>(
    () =>
        CoursesRepoImpl(remoteDatasource: injector<CoursesRemoteDatasource>()),
  );

  injector.registerLazySingleton<CoursesRemoteDatasource>(
    () => CoursesRemoteDatasourceImpl(database: injector<Database>()),
  );
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
      injector<Database>(),
    ),
  );
}

void _setupExternalServices() {
  injector.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(),
  );

  injector.registerLazySingleton<Database>(
    () => FirestoreDBImpl(),
  );
}

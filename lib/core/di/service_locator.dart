import 'package:courses_app/features/courses/data/source/courses_remote_datasource.dart';
import 'package:courses_app/features/home/data/repo/home_repo.dart';

import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/data/source/cart_remote_datasource.dart';
import '../../features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../features/courses/data/repo/courses_repo.dart';
import '../../features/courses/data/repo/courses_repo_impl.dart';
import '../../features/courses/presentation/view_model/courses_cubit/courses_cubit.dart';
import '../../features/courses/presentation/view_model/instructor_cubit/instructor_cubit.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/data/source/home_remote_datasource.dart';
import '../../features/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'di.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  _setupExternalServices();
  _setupAuthFeature();
  _setupCoursesFeature();
  _setupCartFeature();
  _setupHomeFeature();
}

void _setupHomeFeature() {
  injector.registerFactory<CategoryCubit>(
    () => CategoryCubit(injector<HomeRepo>()),
  );

  injector.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remoteDatasource: injector<HomeRemoteDatasource>()),
  );

  injector.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(db: injector<Database>()),
  );
}

void _setupCartFeature() {
  injector.registerFactory<CartCubit>(
    () => CartCubit(injector<CartRepo>()),
  );

  injector.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(remoteDataSource: injector<CartRemoteDataSource>()),
  );

  injector.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(db: injector<Database>()),
  );
}

void _setupCoursesFeature() {
  injector.registerFactory<CoursesCubit>(
    () => CoursesCubit(injector<CoursesRepo>()),
  );

  injector.registerFactory<InstructorCubit>(
    () => InstructorCubit(injector<CoursesRepo>()),
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

import '../../features/my_learning/data/repo/my_learning_repo.dart';
import '../../features/my_learning/data/repo/my_learning_repo_impl.dart';
import '../../features/my_learning/data/source/my_learning_remote_datasource.dart';
import '../../features/my_learning/presentation/view_model/mylearning_cubit/my_leaning_cubit.dart';
import 'di.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  _setupExternalServices();
  _setupAuthFeature();
  _setupCoursesFeature();
  _setupCartFeature();
  _setupHomeFeature();
  _setupWishlistFeature();
  _setupMyLearningFeature();
}

void _setupMyLearningFeature() {
  injector.registerFactory<MyLearningCubit>(
    () => MyLearningCubit(injector<MyLearningRepo>()),
  );

  injector.registerLazySingleton<MyLearningRepo>(
    () => MyLearningRepoImpl(
      remoteDatasource: injector<MyLearningRemoteDatasource>(),
    ),
  );

  injector.registerLazySingleton<MyLearningRemoteDatasource>(
    () => MyLearningRemoteDatasourceImpl(database: injector<Database>()),
  );
}

void _setupWishlistFeature() {
  injector.registerFactory<WishlistCubit>(
    () => WishlistCubit(injector<WishlistRepo>()),
  );

  injector.registerLazySingleton<WishlistRepo>(
    () => WishlistRepoImpl(
      remoteDatasource: injector<WishlistRemoteDatasource>(),
    ),
  );

  injector.registerLazySingleton<WishlistRemoteDatasource>(
    () => WishlistRemoteDatasoureImpl(db: injector<Database>()),
  );
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
  injector.registerFactory<CoursesCategoryCubit>(
    () => CoursesCategoryCubit(injector<CoursesRepo>()),
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

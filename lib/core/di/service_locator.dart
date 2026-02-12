import 'package:courses_app/features/courses/presentation/view_model/review_cubit/review_cubit.dart';

import '../../features/courses/data/repo/reply/reply_repo_impl.dart';
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
  injector.registerFactory<CourseDiscoveryCubit>(
    () => CourseDiscoveryCubit(injector<CoursesRepo>()),
  );

  injector.registerFactory<CourseWatchCubit>(
    () => CourseWatchCubit(
      injector<CoursesRepo>(),
      lessonRepo: injector<LessonRepo>(),
    ),
  );

  injector.registerFactory<ReplyCubit>(
    () => ReplyCubit(injector<ReplyRepo>()),
  );

  injector.registerFactory<ReviewCubit>(
    () => ReviewCubit(injector<ReviewRepo>()),
  );

  injector.registerFactory<LikeDiscussCubit>(
    () => LikeDiscussCubit(injector<DiscussionRepo>()),
  );

  injector.registerFactory<DiscussCubit>(
    () => DiscussCubit(injector<DiscussionRepo>()),
  );

  injector.registerFactory<CoursesCategoryCubit>(
    () => CoursesCategoryCubit(injector<CoursesRepo>()),
  );

  injector.registerFactory<InstructorCubit>(
    () => InstructorCubit(injector<InstructorRepo>()),
  );
  // - repos
  injector.registerLazySingleton<CoursesRepo>(
    () =>
        CoursesRepoImpl(remoteDatasource: injector<CoursesRemoteDatasource>()),
  );

  injector.registerLazySingleton<LessonRepo>(
    () => LessonRepoImpl(remoteDatasource: injector<LessonRemoteDatasource>()),
  );
  injector.registerLazySingleton<ReplyRepo>(
    () => ReplyRepoImpl(remoteDatasource: injector<ReplyRemoteDatasource>()),
  );

  injector.registerLazySingleton<ReviewRepo>(
    () => ReviewRepoImpl(remoteDatasource: injector<ReviewRemoteDatasource>()),
  );
  injector.registerLazySingleton<InstructorRepo>(
    () => InstructorRepoImpl(
      remoteDatasource: injector<InstructorRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<DiscussionRepo>(
    () => DiscussionRepoImpl(
      remoteDatasource: injector<DiscussionRemoteDatasource>(),
    ),
  );
  // - datasources
  injector.registerLazySingleton<LessonRemoteDatasource>(
    () => LessonRemoteDatasourceImpl(database: injector<Database>()),
  );
  injector.registerLazySingleton<ReplyRemoteDatasource>(
    () => ReplyRemoteDatasourceImpl(database: injector<Database>()),
  );
  injector.registerLazySingleton<DiscussionRemoteDatasource>(
    () => DiscussionRemoteDatasourceImpl(database: injector<Database>()),
  );
  injector.registerLazySingleton<ReviewRemoteDatasource>(
    () => ReviewRemoteDatasourceImpl(database: injector<Database>()),
  );
  injector.registerLazySingleton<InstructorRemoteDatasource>(
    () => InstructorRemoteDatasourceImpl(database: injector<Database>()),
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

import 'package:courses_app/features/courses/data/models/reply_model.dart';

import '../models/chapter_model.dart';
import '../models/discuss_model.dart';
import '../models/lesson_model.dart';

import '../../../../core/di/di.dart';
import '../models/course_model.dart';
import '../models/instructor_model.dart';
import '../models/review_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getBestSellerCourses();
  Future<InstructorModel> getInstructorInfo(String instructorId);
  Future<List<CourseModel>> getCoursesByCategory(String categoryId);
  Future<List<LessonModel>> getLessonsByCourseId(String courseId);
  Future<List<ChapterModel>> getChaptersByCourseId(String courseId);
  Future<LessonModel> getLessonByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  );
  Future<LessonModel> getLessonByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  );

  Future<LessonModel> getLastWatchedLesson(
    String courseId,
    String userId,
  );

  Future<void> addReview(String courseId, ReviewModel reviewModel);
  Future<void> addDiscussions(String courseId, DiscussionModel discussionModel);
  Future<void> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  });

  Future<List<ReplyModel>> getReplies(
    String courseId,
    String discussionId,
  );

  Future<List<DiscussionModel>> getDiscussions(String courseId);
  Future<void> toggleLike(
    String courseId,
    String discussionId,
    String userId,
  );

  Future<Set<String>> getMyLikedDiscussions({
    required String courseId,
    required String userId,
  });
}

class CoursesRemoteDatasourceImpl implements CoursesRemoteDatasource {
  final Database database;

  CoursesRemoteDatasourceImpl({required this.database});

  @override
  Future<List<CourseModel>> getCourses() async {
    final courses = await database.getCourses();
    return courses
        .map(
          (course) =>
              CourseModel.fromJson(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<CourseModel>> getBestSellerCourses() async {
    final courses = await database.getBestSellerCourses();
    return courses
        .map(
          (course) =>
              CourseModel.fromJson(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<InstructorModel> getInstructorInfo(String instructorId) async {
    final instructor = await database.getInstructor(instructorId);
    return InstructorModel.fromMap(instructor.data() as Map<String, dynamic>);
  }

  @override
  Future<List<CourseModel>> getCoursesByCategory(String categoryId) async {
    final courses = await database.getCoursesByCategory(categoryId);
    return courses
        .map(
          (course) =>
              CourseModel.fromJson(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<LessonModel>> getLessonsByCourseId(String courseId) async {
    final lessons = await database.getLessonsByCourseId(courseId);
    return lessons
        .map(
          (lesson) => LessonModel.fromJson(
            lesson.data() as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<LessonModel> getLessonByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  ) async {
    final lesson = await database.getLessonByCourseIdAndLessonNumber(
      courseId,
      lessonNumber,
    );
    return LessonModel.fromJson(
      lesson.data() as Map<String, dynamic>,
    );
  }

  @override
  Future<List<ChapterModel>> getChaptersByCourseId(String courseId) async =>
      database.getChaptersByCourseId(courseId);

  @override
  Future<LessonModel> getLessonByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  ) async {
    final lesson = await database.getLessonByCourseIdAndLessonId(
      courseId,
      lessonId,
    );
    return LessonModel.fromJson(
      lesson,
    );
  }

  @override
  Future<void> addReview(String courseId, ReviewModel reviewModel) async =>
      database.addReview(
        courseId: courseId,
        reviewId: reviewModel.userId,
        data: reviewModel.toMap(),
      );

  @override
  Future<LessonModel> getLastWatchedLesson(
    String courseId,
    String userId,
  ) async {
    final lesson = await database.getLastWatchedLesson(courseId, userId);
    return LessonModel.fromJson(lesson);
  }

  @override
  Future<void> addDiscussions(
    String courseId,
    DiscussionModel discussionModel,
  ) async => database.addDiscussionToCourse(
    courseId: courseId,
    discussion: discussionModel,
  );

  @override
  Future<void> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  }) async => database.addReplyToDiscussion(
    courseId: courseId,
    discussionId: discussionId,
    reply: reply,
  );

  @override
  Future<List<DiscussionModel>> getDiscussions(String courseId) async =>
      database.getDiscussions(courseId);

  @override
  Future<List<ReplyModel>> getReplies(
    String courseId,
    String discussionId,
  ) async => database.getReplies(courseId, discussionId);

  @override
  Future<void> toggleLike(
    String courseId,
    String discussionId,
    String userId,
  ) async => database.toggleLike(courseId, discussionId, userId);

  @override
  Future<Set<String>> getMyLikedDiscussions({
    required String courseId,
    required String userId,
  }) async => database.getMyLikedDiscussions(
    courseId: courseId,
    userId: userId,
  );
}

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/chapter_model.dart';
import '../models/course_model.dart';
import '../models/discuss_model.dart';
import '../models/instructor_model.dart';
import '../models/lesson_model.dart';
import '../models/reply_model.dart';
import '../models/review_model.dart';

abstract class CoursesRepo {
  Future<Either<Failure, List<CourseModel>>> getCourses();
  Future<Either<Failure, List<CourseModel>>> getBestSellerCourses();
  Future<Either<Failure, InstructorModel>> getInstructorInfo(
    String instructorId,
  );
  Future<Either<Failure, List<CourseModel>>> getCoursesByCategory(
    String categoryId,
  );

  Future<Either<Failure, List<LessonModel>>> getLessonsByCourseId(
    String courseId,
  );

  Future<Either<Failure, List<ChapterModel>>> getChaptersByCourseId(
    String courseId,
  );

  Future<Either<Failure, LessonModel>> getLessonsByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  );
  Future<Either<Failure, LessonModel>> getLessonsByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  );

  Future<Either<Failure, void>> addReview(
    String courseId,
    ReviewModel reviewModel,
  );

  Future<Either<Failure, void>> addDiscussion(
    String courseId,
    DiscussionModel discussionModel,
  );
  Future<Either<Failure, void>> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  });

  Future<Either<Failure, List<ReplyModel>>> getReplies(
    String courseId,
    String discussionId,
  );

  Future<Either<Failure, List<DiscussionModel>>> getDiscussions(
    String courseId,
  );

  Future<Either<Failure, LessonModel>> getLastLessonWatched(
    String courseId,
    String userId,
  );
}

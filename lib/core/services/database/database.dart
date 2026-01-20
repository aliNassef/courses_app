import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Database {
  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> data,
  });
  Future<void> updateUser(String userId, Map<String, dynamic> data);
  Future<DocumentSnapshot> getUser(String userId);

  Future<void> createCourse({
    required String courseId,
    required Map<String, dynamic> data,
  });
  Future<void> updateCourse(String courseId, Map<String, dynamic> data);
  Future<DocumentSnapshot> getCourse(String courseId);
  Future<List<DocumentSnapshot>> getCourses();
  Future<void> removeCartItem(String userId, String courseId);
  Future<List<DocumentSnapshot>> getBestSellerCourses();
  Future<DocumentSnapshot> getCourseById(String courseId);
  Future<List<DocumentSnapshot>> getCoursesByCategory(String categoryId);
  Future<void> createLesson({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  });
  Future<void> updateLesson({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  });
  Future<DocumentSnapshot> getLesson({
    required String courseId,
    required String lessonId,
  });

  Future<void> addNote({
    required String courseId,
    required String lessonId,
    required String noteId,
    required Map<String, dynamic> data,
  });

  Future<void> addDiscussion({
    required String courseId,
    required String lessonId,
    required String messageId,
    required Map<String, dynamic> data,
  });

  Future<void> addReview({
    required String courseId,
    required String reviewId,
    required Map<String, dynamic> data,
  });

  Future<void> createInstructor({
    required String instructorId,
    required Map<String, dynamic> data,
  });
  Future<DocumentSnapshot> getInstructor(String instructorId);

  Future<void> createCategory({
    required String categoryId,
    required Map<String, dynamic> data,
  });
  Future<DocumentSnapshot> getCategory(String categoryId);
  Future<List<DocumentSnapshot>> getCategories();

  Future<void> addToCart({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  });

  Future<int> getCartItemsCount(String userId);
  Future<List<DocumentSnapshot>> getCartItems(String userId);
  Future<void> addToWishlist({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  });

  Future<List<Map<String, dynamic>>> getWishlistCourses(String userId);
  Future<void> enrollInCourse({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  });

  // --- User Personal History ---
  Future<void> addUserPayment({
    required String userId,
    required String paymentId,
    required Map<String, dynamic> data,
  });
  Future<void> addUserNotification({
    required String userId,
    required String notificationId,
    required Map<String, dynamic> data,
  });

  Future<void> addGlobalPayment({
    required String paymentId,
    required Map<String, dynamic> data,
  });
  Future<void> addGlobalNotification({
    required String notificationId,
    required Map<String, dynamic> data,
  });
  Future<void> addLessonToCourse({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  });

  Future<List<DocumentSnapshot>> getLessonsByCourseId(String courseId);
  Future<DocumentSnapshot<Object?>> getLessonByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  );

  Future<void> addCourseToMyLearning({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  });
  Future<void> updateProgress({
    required String userId,
    required String courseId,
    required String lessonId,
  });

  Future<List<DocumentSnapshot>> getMyLearningCourses(String userId);
  Future<DocumentSnapshot> getLastLearningCourse(String userId);

  Future<Set<String>> getCompletedLessonsIds({
    required String userId,
    required String courseId,
  });

  // Future<List<DocumentSnapshot>> getCurrentLessonOfMyLearning(String userId);
  Future<DocumentSnapshot?> getNextLesson(String courseId, int lessonNumber);
  Future<DocumentSnapshot?> getNextLessonByLastLessonId(
    String courseId,
    String lessonId,
  );
  Future<List<DocumentSnapshot>> getLastCompletedLessonDetails(
    String userId,
  );
}

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

  Future<void> addToCart({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  });
  Future<void> addToWishlist({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  });
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
}

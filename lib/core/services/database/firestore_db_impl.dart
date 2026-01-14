import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/core/errors/server_exception.dart';
import 'package:courses_app/core/services/database/database.dart';
import '../../constants/firesstore_collections_strings.dart';
import '../../logging/app_logger.dart';

class FirestoreDBImpl implements Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .update(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .get();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addToCart({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.cart)
          .doc(courseId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addToWishlist({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.wishlist)
          .doc(courseId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> enrollInCourse({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.myLearning)
          .doc(courseId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addUserPayment({
    required String userId,
    required String paymentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.userPayments)
          .doc(paymentId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addUserNotification({
    required String userId,
    required String notificationId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.userNotifications)
          .doc(notificationId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> createCourse({
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateCourse(String courseId, Map<String, dynamic> data) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .update(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<DocumentSnapshot> getCourse(String courseId) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .get();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> createLesson({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .doc(lessonId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateLesson({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .doc(lessonId)
          .update(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<DocumentSnapshot> getLesson({
    required String courseId,
    required String lessonId,
  }) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .doc(lessonId)
          .get();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addReview({
    required String courseId,
    required String reviewId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.reviews)
          .doc(reviewId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addNote({
    required String courseId,
    required String lessonId,
    required String noteId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .doc(lessonId)
          .collection(FirestoreCollectionsStrings.notes)
          .doc(noteId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addDiscussion({
    required String courseId,
    required String lessonId,
    required String messageId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .doc(lessonId)
          .collection(FirestoreCollectionsStrings.discuss)
          .doc(messageId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> createInstructor({
    required String instructorId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.instructors)
          .doc(instructorId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<DocumentSnapshot> getInstructor(String instructorId) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.instructors)
          .doc(instructorId)
          .get();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> createCategory({
    required String categoryId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.categories)
          .doc(categoryId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<DocumentSnapshot> getCategory(String categoryId) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.categories)
          .doc(categoryId)
          .get();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addGlobalPayment({
    required String paymentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.payments)
          .doc(paymentId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addGlobalNotification({
    required String notificationId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.notifications)
          .doc(notificationId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getCourses() async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getBestSellerCourses() async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .where('bestSeller', isEqualTo: true)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<int> getCartItemsCount(String userId) async {
    try {
      final snapshot = await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.cart)
          .get();

      return snapshot.docs.length;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getCartItems(String userId) async {
    try {
      final snapshot = await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.cart)
          .get();

      return snapshot.docs;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getCategories() async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.categories)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> removeCartItem(String userId, String courseId) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.cart)
          .doc(courseId)
          .delete();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getWishlistCourses(
    String userId,
  ) async {
    final wishlistSnapshot = await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .collection(FirestoreCollectionsStrings.wishlist)
        .get();

    if (wishlistSnapshot.docs.isEmpty) return [];
    AppLogger.info(wishlistSnapshot.docs.first.id.toString());
    final List<Map<String, dynamic>> courses = [];

    for (final wishlistDoc in wishlistSnapshot.docs) {
      final courseDoc = await getCourseById(wishlistDoc.id);
      AppLogger.info(courseDoc.id.toString());

      AppLogger.info(courseDoc.metadata.toString());

      courses.add(courseDoc.data() as Map<String, dynamic>);
    }
    AppLogger.info(courses.length.toString());
    for (var course in courses) {
      AppLogger.info(course.toString());
    }
    return courses;
  }

  @override
  Future<DocumentSnapshot> getCourseById(String courseId) async {
    try {
      final courseSnapshot = await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId.trim())
          .get();

      if (!courseSnapshot.exists) {
        throw ServerException('Course not found');
      }

      return courseSnapshot;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getCoursesByCategory(
    String categoryId,
  ) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .where('categoryId', isEqualTo: categoryId.trim())
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addLessonToCourse({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .doc(lessonId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getLessonsByCourseId(
    String courseId,
  ) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .orderBy('order')
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<DocumentSnapshot<Object?>> getLessonByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  ) async {
    try {
      final lessons = await _firestore
          .collection(FirestoreCollectionsStrings.courses)
          .doc(courseId)
          .collection(FirestoreCollectionsStrings.lessons)
          .get();
      return lessons.docs.where((l) => l.data()['order'] == lessonNumber).first;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addCourseToMyLearning({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.myLearning)
          .doc(courseId)
          .set(data);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateProgress({
    required String userId,
    required String courseId,
    required String lessonId,
  }) async {
    try {
      final docRef = _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.myLearning)
          .doc(courseId);

      final snapshot = await docRef.get();
      final data = snapshot.data()!;

      final completedLessons = data['completedLessons'] + 1;
      final totalLessons = data['totalLessons'];

      final progress = (completedLessons / totalLessons) * 100;

      await docRef.update({
        'completedLessons': completedLessons,
        'progress': progress,
        'lastLessonId': lessonId,
        'status': progress == 100 ? 'completed' : 'ongoing',
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getMyLearningCourses(
    String userId,
  ) async {
    try {
      return await _firestore
          .collection(FirestoreCollectionsStrings.users)
          .doc(userId)
          .collection(FirestoreCollectionsStrings.myLearning)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}

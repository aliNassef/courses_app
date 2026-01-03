import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/core/services/database/database.dart';
import '../../constants/firesstore_collections_strings.dart';

class FirestoreDBImpl implements Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .set(data);
  }

  @override
  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .update(data);
  }

  @override
  Future<DocumentSnapshot> getUser(String userId) async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .get();
  }

  @override
  Future<void> addToCart({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .collection(FirestoreCollectionsStrings.cart)
        .doc(courseId)
        .set(data);
  }

  @override
  Future<void> addToWishlist({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .collection(FirestoreCollectionsStrings.wishlist)
        .doc(courseId)
        .set(data);
  }

  @override
  Future<void> enrollInCourse({
    required String userId,
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .collection(FirestoreCollectionsStrings.myLearning)
        .doc(courseId)
        .set(data);
  }

  @override
  Future<void> addUserPayment({
    required String userId,
    required String paymentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .collection(FirestoreCollectionsStrings.userPayments)
        .doc(paymentId)
        .set(data);
  }

  @override
  Future<void> addUserNotification({
    required String userId,
    required String notificationId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.users)
        .doc(userId)
        .collection(FirestoreCollectionsStrings.userNotifications)
        .doc(notificationId)
        .set(data);
  }

  @override
  Future<void> createCourse({
    required String courseId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .set(data);
  }

  @override
  Future<void> updateCourse(String courseId, Map<String, dynamic> data) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .update(data);
  }

  @override
  Future<DocumentSnapshot> getCourse(String courseId) async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .get();
  }

  @override
  Future<void> createLesson({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .collection(FirestoreCollectionsStrings.lessons)
        .doc(lessonId)
        .set(data);
  }

  @override
  Future<void> updateLesson({
    required String courseId,
    required String lessonId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .collection(FirestoreCollectionsStrings.lessons)
        .doc(lessonId)
        .update(data);
  }

  @override
  Future<DocumentSnapshot> getLesson({
    required String courseId,
    required String lessonId,
  }) async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .collection(FirestoreCollectionsStrings.lessons)
        .doc(lessonId)
        .get();
  }

  @override
  Future<void> addReview({
    required String courseId,
    required String reviewId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .collection(FirestoreCollectionsStrings.reviews)
        .doc(reviewId)
        .set(data);
  }

  @override
  Future<void> addNote({
    required String courseId,
    required String lessonId,
    required String noteId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .collection(FirestoreCollectionsStrings.lessons)
        .doc(lessonId)
        .collection(FirestoreCollectionsStrings.notes)
        .doc(noteId)
        .set(data);
  }

  @override
  Future<void> addDiscussion({
    required String courseId,
    required String lessonId,
    required String messageId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .doc(courseId)
        .collection(FirestoreCollectionsStrings.lessons)
        .doc(lessonId)
        .collection(FirestoreCollectionsStrings.discuss)
        .doc(messageId)
        .set(data);
  }

  @override
  Future<void> createInstructor({
    required String instructorId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.instructors)
        .doc(instructorId)
        .set(data);
  }

  @override
  Future<DocumentSnapshot> getInstructor(String instructorId) async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.instructors)
        .doc(instructorId)
        .get();
  }

  @override
  Future<void> createCategory({
    required String categoryId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.categories)
        .doc(categoryId)
        .set(data);
  }

  @override
  Future<DocumentSnapshot> getCategory(String categoryId) async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.categories)
        .doc(categoryId)
        .get();
  }

  @override
  Future<void> addGlobalPayment({
    required String paymentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.payments)
        .doc(paymentId)
        .set(data);
  }

  @override
  Future<void> addGlobalNotification({
    required String notificationId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(FirestoreCollectionsStrings.notifications)
        .doc(notificationId)
        .set(data);
  }

  @override
  Future<List<DocumentSnapshot<Object?>>> getCourses() async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .get()
        .then((querySnapshot) => querySnapshot.docs);
  }
  
  @override
  Future<List<DocumentSnapshot<Object?>>> getBestSellerCourses() async {
    return await _firestore
        .collection(FirestoreCollectionsStrings.courses)
        .where('bestSeller', isEqualTo: true)
        .get()
        .then((querySnapshot) => querySnapshot.docs);
  }
}

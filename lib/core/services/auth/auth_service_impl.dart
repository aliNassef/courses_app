import '../../constants/firesstore_collections_strings.dart';
import '../../logging/app_logger.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../translations/locale_keys.g.dart';
import '../../errors/server_exception.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = cred.user;

      if (user != null) {
        String? token = await _fcm.getToken();

        await _firestore
            .collection(FirestoreCollectionsStrings.users)
            .doc(user.uid)
            .set({
              'name': name,
              'email': email,
              'image': '',
              'description': '',
              'createdAt': FieldValue.serverTimestamp(),
              'fcmTokens': token != null ? {token: true} : {},
              "numberOfCourses": 0,
              "numberOfAchievements": 0,
              "numberOfCerts": 0,
            });
      }
      return user!;
    } on FirebaseAuthException catch (e) {
      AppLogger.error('SignUp Error: ${e.code}');
      throw ServerException(_mapFirebaseAuthErrorToMessage(e.code));
    } catch (e) {
      AppLogger.error('SignUp Error: $e');
      throw ServerException(LocaleKeys.unknown_error.tr());
    }
  }

  @override
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = cred.user;

      if (user != null) {
        String? token = await _fcm.getToken();

        if (token != null) {
          await _firestore
              .collection(FirestoreCollectionsStrings.users)
              .doc(user.uid)
              .update({
                'fcmTokens.$token': true,
              });
        }
      }
      return user!;
    } on FirebaseAuthException catch (e) {
      AppLogger.error('SignIn Error: ${e.code}');
      throw ServerException(_mapFirebaseAuthErrorToMessage(e.code));
    } catch (e) {
      AppLogger.error('SignIn Error: $e');
      throw ServerException(LocaleKeys.unknown_error.tr());
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  void listenFCMTokenRefresh() {
    _fcm.onTokenRefresh.listen((newToken) async {
      if (currentUser != null) {
        await _firestore
            .collection(FirestoreCollectionsStrings.users)
            .doc(currentUser!.uid)
            .update({
              'fcmTokens.$newToken': true,
            });
      }
    });
  }

  String _mapFirebaseAuthErrorToMessage(String code) {
    switch (code) {
      case 'weak-password':
        return LocaleKeys.weak_password.tr();
      case 'email-already-in-use':
        return LocaleKeys.email_already_in_use.tr();
      case 'user-not-found':
        return LocaleKeys.user_not_found.tr();
      case 'wrong-password':
        return LocaleKeys.wrong_password.tr();
      case 'invalid-email':
        return LocaleKeys.invalid_email.tr();
      default:
        return LocaleKeys.unknown_error.tr();
    }
  }
}

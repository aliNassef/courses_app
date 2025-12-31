import 'package:courses_app/core/constants/firesstore_collections_strings.dart';
 import 'package:courses_app/core/logging/app_logger.dart';
import 'package:courses_app/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
            });
      }
      return user!;
    } catch (e) {
      AppLogger.error('SignUp Error: $e');
      throw ServerException('SignUp Error: $e');
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
    } catch (e) {
      AppLogger.error('SignIn Error: $e');
      throw ServerException('SignIn Error: $e');
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
}

import 'dart:developer';

import 'package:auth_firebase/commons/utils/server_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth;

  AuthenticationService({required this.firebaseAuth});

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // log("user: ${userCredential.toString()}");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.message!.contains("The supplied auth credential is incorrect")) {
        // log("nimadir");
        throw ServerException(statusCode: 500, message: "User not found");
      }
      // log("error ${e.toString()}");
      return false;
    } catch (e) {
      log("unknown error login : $e");
      throw ServerException(message: "unknown error", statusCode: 500);
    }
  }

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      log(userCredential.toString());
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.message!.contains(
          "The email address is already in use by another account.")) {
        throw ServerException(
            message: "The email address is already in use by another account.",
            statusCode: 400);
      }
      return false;
    } catch (e) {
      log("unknown error: ${e.toString()}");
      throw Exception("Unknown error");
    }
  }
}

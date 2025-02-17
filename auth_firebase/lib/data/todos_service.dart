import 'dart:developer';

import 'package:auth_firebase/commons/utils/server_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodosService {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;
  final String todosCollecntionName = "todos";

  TodosService(this.auth, {required this.firebaseFirestore});

//add new todo
  Future<bool> addTodo({required String title, required bool isComplited}) async {
    try {
      final userID = auth.currentUser?.uid;
      if (userID == null) {
        throw ServerException(
            message: "User is not registrated", statusCode: 500);
      }
      final result = await firebaseFirestore
          .collection(todosCollecntionName)
          .add({"userId": userID, "title": title, "isComplited": isComplited});
      log(result.toString());

      return true;
    } catch (e) {
      log("error while adding: $e");
      return false;
    }
  }

  //get all todos
  Stream<List<Map<String, dynamic>>> getAllTodos() {
    try {
      final userId = auth.currentUser?.uid;
      if (userId == null) {
        throw Exception(
            'Foydalanuvchi tizimga kirmagan');
      }

      return firebaseFirestore
          .collection(todosCollecntionName)
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList());
    } catch (e) {
      log("error getting todos: $e");
      return Stream.value([]);
    }
  }


}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_lesson/homework/models/post_model.dart';

final futureDataProvider = FutureProvider<List<PostModel>>(
  (ref) async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      log(response.body);

      final payload = jsonDecode(response.body);
      final List<PostModel> data = (payload as List).map((e) => PostModel.fromJson(e)).toList();

      return data;
    } else {
      throw Exception("Failed to load posts");
    }
  },
);
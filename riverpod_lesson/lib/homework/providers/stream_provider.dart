import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_lesson/homework/models/post_model.dart';

final streamProvider = StreamProvider<List<PostModel>>(
  (ref) {
    return Stream.periodic(Duration(seconds: 1), (count) => count)
        .asyncMap((count) async {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final payload = jsonDecode(response.body);
        final List<PostModel> data =
            (payload as List).map((e) => PostModel.fromJson(e)).toList();
        return data;
      } else {
        throw Exception("Failed to load posts");
      }
    });
  },
);

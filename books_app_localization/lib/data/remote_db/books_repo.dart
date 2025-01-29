import 'dart:convert';
import 'dart:developer';

import 'package:books_app_localization/common/network_constants.dart';
import 'package:books_app_localization/data/models/books_model.dart';
import 'package:http/http.dart' as http;

class BooksRepo {
  Future<List<BooksModel>> getAllBooks() async {
    final url = Uri.parse(NetworkConstants.allBooksUrl);

    try {
      final response = await http.get(url);

      log("response ${response.toString()}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("data $data");
        // List<BooksModel> books =
        //     data.map((item) => BooksModel.fromJson(item)).toList();
        // List<BooksModel> books =
        //     data.map((item) => BooksModel.fromJson(item)).toList();

        List<BooksModel> books = booksModelFromJson(response.body);
        log(books.toString());
        return books;
      } else {
        throw Exception(
            "Error occurred while getting data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error nimadir: $e");
    }
  }
}

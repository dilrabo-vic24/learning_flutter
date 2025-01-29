import 'dart:developer';

import 'package:books_app_localization/data/models/books_model.dart';
import 'package:books_app_localization/data/remote_db/books_repo.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  final BooksRepo booksRepo;

  BooksProvider({required this.booksRepo});
  bool isLoading = false;
  List<BooksModel> allBooks = [];

  Future<void> getAllBooks() async {
    isLoading = true;
    notifyListeners();
    // log("nimadir");
    final response = await booksRepo.getAllBooks();
    log(response.toString());
    allBooks = response;
    // log(allBooks.toString());
    isLoading = false;
    notifyListeners();
  }
}

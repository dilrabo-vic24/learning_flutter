import 'dart:developer';

import 'package:books_app_localization/presentation/widgets/custom_container.dart';
import 'package:books_app_localization/presentation/widgets/custom_text_style.dart';
import 'package:books_app_localization/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdddddd),
      appBar: AppBar(
        backgroundColor: const Color(0xFFdddddd),
        title: Center(child: customTextStyle(text: "Book of the week")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomContainer(),
            customTextStyle(
                text: "Popular books",
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
            Consumer<BooksProvider>(
              builder: (context, bookProvider, child) {
                // log(bookProvider.allBooks[0].title!);
                return SizedBox(
                  // width: 300,
                  height: 420.h,
                  child: ListView.builder(
                    itemCount: bookProvider.allBooks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        width: 300,
                        padding: EdgeInsets.all(2.w),
                        margin: EdgeInsets.all(3.w),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset("assets/images/book1.png"),
                            SizedBox(width: 7.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextStyle(
                                    text:
                                        "Name: ${bookProvider.allBooks[index].title!}"),
                                customTextStyle(
                                    text:
                                        "Author: ${bookProvider.allBooks[index].author!}",
                                    fontWeight: FontWeight.w400),
                                customTextStyle(
                                    text:
                                        "Genre: ${bookProvider.allBooks[index].genre}",
                                    fontWeight: FontWeight.w400),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

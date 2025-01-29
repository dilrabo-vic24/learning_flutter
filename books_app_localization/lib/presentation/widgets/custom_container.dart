import 'package:books_app_localization/presentation/widgets/custom_text_style.dart';
import 'package:books_app_localization/presentation/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(3, 3),
            ),
          ],
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/book1.png", width: 100, height: 150),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextStyle(
                  text: "The Psychology of Money",
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              SizedBox(
                width: 150,
                child: customTextStyle(
                    text:
                        "The psychology of money is the study of our behavior with money. Success with money isn't about knowledge, IQ or how good you are at math. It's about behavior, and everyone is prone to certain behaviors over others.",
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomWidget(),
                  CustomWidget(
                    text: "Learn more",
                    color: Colors.white,
                    textColor: Colors.black,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

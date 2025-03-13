import 'package:agronom_ai/widgets/result_action_button.dart';
import 'package:agronom_ai/widgets/result_info_widget.dart';
import 'package:agronom_ai/widgets/result_input_widget.dart';
import 'package:agronom_ai/widgets/result_main_image.dart';
import 'package:agronom_ai/widgets/result_title_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String title;

  ResultScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Natija', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResultMainImage(),
                  ResultTitleWidget(),
                  ResultQuestion(),
                  ResultInfoWidget(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          ResultInputWidget(),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:working_with_isolates/provider.dart';

class SortNumbersScreen extends StatefulWidget {
  const SortNumbersScreen({super.key});

  @override
  State<SortNumbersScreen> createState() => _SortNumbersScreenState();
}

class _SortNumbersScreenState extends State<SortNumbersScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolate Sorting"),
        centerTitle: true,
      ),
      body: Consumer<SortNumbersProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "How many number?",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    log("nimadir");
                    // provider.isLoading
                    //     ? null
                    //     : () {
                    //         log("nimadir");
                    //         final count =
                    //             int.tryParse(controller.text.trim()) ?? 0;
                    //         provider.sortNumbers(count);
                    //       };
                    final count = int.tryParse(controller.text.trim()) ?? 0;
                    provider.sortNumbers(count);
                  },
                  child: provider.isLoading
                      ? CircularProgressIndicator()
                      : Text("Sort"),
                ),
                SizedBox(height: 20),
                if (provider.sortedNumbers.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        "Sorted time: ${provider.sortTime.toStringAsFixed(2)} seconds",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "First 10 number: ${provider.sortedNumbers}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}

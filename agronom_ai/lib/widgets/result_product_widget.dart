// widgets/detail_product_section.dart
import 'package:flutter/material.dart';

class ResultProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Qayda dori',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Hozirgacha sinagan eng yaxshi dorilar! Ularning baʻzisi juda yaxshilari kam chiniga oʻta salgina tajribadan kechirildi. Demak taqsimot, baʻzilariga istisno ishonchli dori.',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Image.network(
                'https://placehold.co/80x150/grey',
                width: 80,
                height: 100,
              ),
              SizedBox(width: 16),
              Image.network(
                'https://placehold.co/80x150/grey',
                width: 80,
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
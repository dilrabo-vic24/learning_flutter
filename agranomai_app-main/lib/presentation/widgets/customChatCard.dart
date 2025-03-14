import 'package:agranom_ai/data/models/get_predict_dto.dart';
import 'package:flutter/material.dart';

class CabbageLoopersCard extends StatelessWidget {
  final Data data;
  final String errorText;

  const CabbageLoopersCard({
    super.key,
    required this.data,
    this.errorText = "",
  });

  @override
  Widget build(BuildContext context) {
    // final images = ["${data.type?.images}"];
    final name = "${data.type?.name}";
    final imageUrl = "https://api.agronomai.birnima.uz${data.image}";
    final nameUz = "${data.type?.nameUz}";
    final description = "${data.type?.description}";
    final confidence = double.parse("${data.confidence}");
    final createdAt = "${data.createdAt}";

    if (errorText.contains("Xatolik")) {
      return _buildErrorCard();
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageWidget(imageUrl),
            const SizedBox(height: 16),
            _buildTitleSection(name, nameUz),
            const SizedBox(height: 8),
            _buildDescriptionText(description),
            const SizedBox(height: 16),
            _buildMetadataSection(confidence, createdAt),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard() {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              errorText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[300],
            child: Icon(Icons.broken_image, color: Colors.grey[600]),
          );
        },
      ),
    );
  }

  Widget _buildTitleSection(String name, String nameUz) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          nameUz,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionText(String description) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[800],
      ),
    );
  }

  Widget _buildMetadataSection(double confidence, String createdAt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confidence: ${confidence.toStringAsFixed(2)}%",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
          ),
        ),
        Text(
          "Created: ${createdAt.substring(0, 10)}",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

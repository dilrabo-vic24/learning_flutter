import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_upload_lesson/image_service.dart';
import 'package:provider/provider.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  @override
  void initState() {
    Provider.of<ImageService>(context, listen: false).fetchImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = context.watch<ImageService>();

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Upload Image", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageProvider.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      imageProvider.image!,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
                    ),
                    child: Center(child: Text("No image selected")),
                  ),
            SizedBox(height: 20),
            if (imageProvider.isUploading)
              Column(
                children: [
                  LinearProgressIndicator(),
                  SizedBox(height: 10),
                  Text("Uploading...", style: TextStyle(color: Colors.grey)),
                ],
              ),
            if (imageProvider.imageUrl != null)
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageProvider.imageUrl!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: imageProvider.pickImage,
                  icon: Icon(Icons.photo_camera),
                  label: Text("Pick Image"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: imageProvider.postImage,
                  icon: Icon(Icons.upload),
                  label: Text("Upload"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Downloaded Images",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: imageProvider.images.length,
                itemBuilder: (context, index) {
                  String imageUrl = imageProvider.images[index];

                  return Column(
                    children: [
                      Image.network(
                        "https://1027-89-236-218-41.ngrok-free.app${imageUrl}",
                        width: 300,
                        height: 200,
                      ),
                      IconButton(
                        icon: Icon(Icons.download),
                        onPressed: () {
                          imageProvider.downloadImage(
                            "https://1027-89-236-218-41.ngrok-free.app${imageUrl}",
                            
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                imageProvider.message,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                          log(imageProvider.message);
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

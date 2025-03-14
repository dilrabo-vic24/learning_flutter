import 'dart:io';
import 'package:agranom_ai/bloc/image_upload_bloc/image_upload_bloc.dart';
import 'package:agranom_ai/common/utils/enums/statuses.dart';
import 'package:agranom_ai/data/services/image_picker_service.dart';
import 'package:agranom_ai/presentation/widgets/customChatCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final TextEditingController _textController = TextEditingController();
  String errorText = "";

  Future<void> _pickImage(bool fromCamera) async {
    try {
      final image = await _imagePickerService.pickImage(fromCamera: fromCamera);
      if (image != null && mounted) {
        context.read<ImageUploadBloc>().add(
              ImageUploadEvent.getImagePath(imagefile: image),
            );
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar("Error picking image: $e");
      }
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          final isUserMessage = index % 2 == 0;
          return Align(
            alignment:
                isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width * 0.75,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 20,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleSendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      // Handle sending text message
      _textController.clear();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/landing'),
        ),
        title: const Text(
          "Plant Analysis",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.green.withOpacity(0.1),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<ImageUploadBloc, ImageUploadState>(
                  listener: (context, state) {
                    // Clear any existing SnackBars first
                    ScaffoldMessenger.of(context).clearSnackBars();

                    if (state.status == Statuses.Success &&
                        state.imagePath == null) {
                      _showSuccessSnackBar("Image uploaded successfully!");
                    } else if (state.status == Statuses.Error) {
                      errorText = "Failed to process image. Please try again.";
                      _showErrorSnackBar("Error: $errorText");
                    }

                    if (state.imagePath != null) {
                      context.read<ImageUploadBloc>().add(
                            ImageUploadEvent.getPredict(
                              imagePath: state.imagePath!,
                            ),
                          );
                    }
                  },
                  builder: (context, state) {
                    if (state.status == Statuses.Loading) {
                      return _buildShimmerLoading();
                    }

                    if (state.messages?.isEmpty ?? true) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: 100,
                                color: Colors.green.withOpacity(0.5),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  "Take or upload a photo to analyze",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(16),
                      itemCount: state.messages?.length ?? 0,
                      itemBuilder: (context, index) {
                        final message =
                            state.messages![state.messages!.length - 1 - index];
                        final isUserMessage = message['isUser'] as bool;

                        return Align(
                          alignment: isUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isUserMessage
                                  ? Colors.green.shade500
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.75,
                                  minWidth: 100,
                                ),
                                child: message['type'] == 'image'
                                    ? Image.file(
                                        message['content'] as File,
                                        fit: BoxFit.cover,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: CabbageLoopersCard(
                                          data: message['content'],
                                          errorText: errorText,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => _pickImage(true),
                                icon: const Icon(Icons.camera_alt,
                                    color: Colors.green),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: _textController,
                                  decoration: const InputDecoration(
                                    hintText: "Type a message...",
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () => _pickImage(false),
                                icon: const Icon(Icons.photo_library,
                                    color: Colors.green),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.green, Color(0xff81C784)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: _handleSendMessage,
                          icon: const Icon(Icons.send, color: Colors.white),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

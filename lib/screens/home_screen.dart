import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/classifier.dart';
import 'result_screen.dart';
import '../../widgets/image_preview.dart';
import 'package:flutter/foundation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage(ImageSource source) async {
    // Task 2:
    // Use the ImagePicker to select an image from the camera or gallery
    // If the platform is web, read the image as bytes and store it in _selectedImage
    // If the platform is mobile, store the File in _selectedImage
    // Make sure to check if the picked file is not null before proceeding
    // Call this function from the respective UI button
    // Hint: make sure to use setState to update the UI after picking the image
  }

  Future<void> _classifyImage() async {
    // Task 3:
    // Call the Classifier class to run inference on the selected image (it will return a mock string for now)
    // Navigate to the ResultScreen with the image and result using Navigator.push
    // Reset the selected image after classification to prepare for the next one (you can do this in the then callback of Navigator.push)
    // Hint: you might want to check if _selectedImage is null before classifying
  }

  @override
  Widget build(BuildContext context) {
    // Task 1:
    // Build the UI with an AppBar, a Text widget to prompt the user, and
    // an ImagePreview widget to show the selected image
    // Add one button for selecting an image from the gallery (ImageSource.gallery)
    // Add a button to trigger the classification process (call _classifyImage)
    // Use a Column to arrange the widgets vertically
    return Scaffold();
  }
}

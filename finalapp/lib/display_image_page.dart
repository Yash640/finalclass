import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DisplayImagePage extends StatelessWidget {
  final XFile? image;

  DisplayImagePage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Image'),
      ),
      body: Center(
        child: image != null
            ? Image.file(File(image!.path))
            : const Text('No image selected'),
      ),
    );
  }
}

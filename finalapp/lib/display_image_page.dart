import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DisplayImagePage extends StatelessWidget {
  final XFile? image;
  final Function() openCamera; // Reference to camera function from main.dart

  const DisplayImagePage({required this.image, required this.openCamera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 241, 86),
      body: Center( // Center all elements vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align vertically
          children: [
            // Text for "Image"
            const Text(
              'Image',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20.0), // Add spacing

            // Display the captured image with a smaller size (adjust as needed)
            image != null
                ? Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: FileImage(File(image!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Text(
                    'No image selected', // Display placeholder if no image
                    style: TextStyle(fontSize: 20),
                  ),

            const SizedBox(height: 20.0), // Add spacing

            // Row for buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Replace with your submit button logic
                    print('Submit button pressed!');
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context), // Navigate back
                  child: const SizedBox(
                    width: 100,
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Back',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

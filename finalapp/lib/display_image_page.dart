import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DisplayImagePage extends StatelessWidget {
  final XFile? image;
  final Function() openCamera; 

  const DisplayImagePage({required this.image, required this.openCamera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 241, 86),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            
            const Text(
              'Image',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20.0), 

          
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
                    'No image selected', 
                    style: TextStyle(fontSize: 20),
                  ),

            const SizedBox(height: 20.0), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ElevatedButton(
                  onPressed: () {
                    
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
                  onPressed: () => Navigator.pop(context), 
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

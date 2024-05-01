import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'display_image_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;

  Future<void> _openImagePicker() async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile!= null) {
      setState(() {
        image = pickedFile;
      });
    } else {
      print('No image selected');
    }
  }

  Future<void> _openCamera() async {
  final XFile? pickedFile = await _imagePicker.pickImage(
    source: ImageSource.camera,
  );
  if (pickedFile != null) {
    setState(() {
      image = pickedFile;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayImagePage(image: image),
      ),
    );
  } else {
    print('No image selected');
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Camera Page'),
        ),
        backgroundColor: const Color.fromARGB(255, 125, 241, 86),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _openCamera,
                    child: const SizedBox(
                      width: 100,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Camera',
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
                    onPressed: _openImagePicker,
                    child: const SizedBox(
                      width: 100,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gallery',
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  //chat with the bot
                  print('Chat with Bot');
                },
                child: const SizedBox(
                  width: 200,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chat with Bot',
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
        ),
      ),
    );
  }
}
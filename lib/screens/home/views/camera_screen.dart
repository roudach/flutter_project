import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> uploadPicture(File imageFile) async {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/${basename(imageFile.path)}');
    final uploadTask = firebaseStorageRef.putFile(imageFile);
    await uploadTask;
    final url = await firebaseStorageRef.getDownloadURL();
    print('Uploaded image URL: $url');
    await saveImageUrlToFirestore(url); // Enregistrer l'URL dans Firestore
  }

  Future<void> saveImageUrlToFirestore(String imageUrl) async {
    final CollectionReference images = FirebaseFirestore.instance.collection('images');
    await images.add({'url': imageUrl});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            if (!mounted) return;
            final Directory appDirectory = await getApplicationDocumentsDirectory();
            final String imagePath = '${appDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
            File(image.path).copy(imagePath);
            uploadPicture(File(imagePath));
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
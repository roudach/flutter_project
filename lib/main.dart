import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/SimpleBlocObserver.dart';
import 'package:flutter_project/screens/home/views/camera_screen.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  // Initialiser la caméra
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera, userRepo: FirebaseUserRepo()));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  final FirebaseUserRepo userRepo;

  const MyApp({Key? key, required this.camera, required this.userRepo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(camera: camera),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final CameraDescription camera;

  const HomeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, you are In!'),
        actions: [
          IconButton(
            onPressed: () {
              // Ajouter votre logique de déconnexion ici
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakePictureScreen(camera: camera),
              ),
            );
          },
          child: Text('Open Camera'),
        ),
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:signer/dashboard.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

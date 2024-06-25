import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:signer/dashboard.dart';
import 'package:tflite/tflite.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String answer = "";
  CameraController? cameraController;
  CameraImage? cameraImage;

  loadmodel() async {
    Tflite.loadModel(
      model: "assets/detect.tflite",
      labels: "assets/labels.txt",
    );
  }

  initCamera() {
    // cameraController = CameraController(cameras![0], ResolutionPreset.medium);

    // OR
    cameraController = CameraController(
      const CameraDescription(
        name: '0', // 0 for back camera and 1 for front camera
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0,
      ),
      ResolutionPreset.medium,
    );

    cameraController!.initialize().then(
      (value) {
        if (!mounted) {
          return;
        }
        setState(
          () {
            cameraController!.startImageStream(
              (image) => {
                if (true)
                  {
                    setState(
                      () {
                        cameraImage = image;
                      },
                    ),
                    cameraImage = image,
                    applymodelonimages(),
                  }
              },
            );
          },
        );
      },
    );
  }

  applymodelonimages() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map(
          (plane) {
            return plane.bytes;
          },
        ).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 1,
        threshold: 0.1,
        asynch: true,
      );

      answer = '';

      predictions!.forEach(
        (prediction) {
          answer +=
                  prediction['label'].toString().substring(1) +
                  " " +
                  (prediction['confidence'] as double).toStringAsFixed(3) +
                  '\n';
        },
      );

      setState(
        () {
          answer = answer;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
    // loadmodel();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Detect"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings),
              )
            ],
          ),
          body: cameraImage != null
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: AspectRatio(
                              aspectRatio: cameraController!.value.aspectRatio,
                              child: CameraPreview(
                                cameraController!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.black87,
                            child: Center(
                              child: Text(
                                answer,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}

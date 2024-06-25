import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signer/screens/home.dart';
import 'package:signer/screens/widgets.dart';
import 'package:tflite/tflite.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _modelLoaded = false;
  bool _loadingFailed = false;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/detect.tflite",
        labels: "assets/labels.txt",
      );
      setState(() {
        _modelLoaded = true;
      });
    } catch (e) {
      setState(() {
        _loadingFailed = true;
      });
      print("Error loading model: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Welcome to Signer!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CachedNetworkImage(
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ContainerLoadingAnimation(
                        height: MediaQuery.of(context).size.height * 0.48,
                        radius: 8,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl:
                          'https://images.pexels.com/photos/6322051/pexels-photo-6322051.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _modelLoaded
                    ? Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          },
                          child: Text(
                            'Start Detecting',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : _loadingFailed
                        ? Text(
                            'Failed to load model. Please try again later.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          )
                        : CircularProgressIndicator(), // Show loading indicator
              ],
            ),
          ],
        ),
      ),
    );
  }
}

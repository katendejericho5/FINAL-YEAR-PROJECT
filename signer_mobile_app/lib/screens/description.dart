import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:signer/screens/widgets.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'How It Works',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView(
          children: [
            SizedBox(
              width: 40,
            ),
            Hero(
              tag: 'object_detection_image', // Unique tag for the image
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
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
                    imageUrl:
                        'https://images.pexels.com/photos/6322483/pexels-photo-6322483.jpeg?auto=compress&cs=tinysrgb&w=600', // Provide the URL of your image
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Understanding the Object Detection Model',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'The object detection model used in this application is powered by TensorFlow Lite, a lightweight and efficient machine learning framework. This model has been trained on a large dataset of labeled images, allowing it to recognize a wide range of everyday objects with high accuracy.',
            ),
            const SizedBox(height: 16),
            const Text(
              'How the Model Works',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'The model works by analyzing the input image and identifying objects within it. It then draws bounding boxes around the detected objects and labels them with their corresponding class names. The model is capable of detecting multiple objects in a single image and can provide real-time results on mobile devices.',
            ),
          ],
        ),
      ),
    );
  }
}

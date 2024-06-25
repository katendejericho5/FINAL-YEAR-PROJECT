import 'package:flutter/material.dart';


class LetterDetailsScreen extends StatelessWidget {
  final String letter;
  final String imagePath;
  final String description;

  LetterDetailsScreen({
    required this.letter,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Letter Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Hero(
            tag: 'letter_image_$imagePath', // Unique tag for the Hero animation
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imagePath,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Letter: $letter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

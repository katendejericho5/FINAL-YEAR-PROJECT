import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signer/data/sign_data.dart';
import 'package:signer/screens/description.dart';
import 'package:signer/screens/learn_signs.dart';
import 'package:signer/screens/widgets.dart';
import 'package:signer/screens/xai.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Language Learning',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Display 2 items per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildCard(
              imagePath:
                  'https://images.pexels.com/photos/6322483/pexels-photo-6322483.jpeg?auto=compress&cs=tinysrgb&w=600', // Provide the URL of your image

              title: 'Learn Sign Language',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignLanguageScreen(
                      signLanguageLetters,
                    ),
                  ),
                );
              },
            ),
            _buildCard(
              imagePath:
                  'https://images.pexels.com/photos/6322483/pexels-photo-6322483.jpeg?auto=compress&cs=tinysrgb&w=600', // Provide the URL of your image

              title: 'How the Model Works',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionPage(),
                  ),
                );
              },
            ),
            _buildCard(
              imagePath:
                  'https://images.pexels.com/photos/6322483/pexels-photo-6322483.jpeg?auto=compress&cs=tinysrgb&w=600', // Provide the URL of your image

              title: 'Explainability',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => XaiModelsGridScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    // Generate a unique Hero tag based on the title and imagePath
    String heroTag = '${title}_$imagePath';

    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: heroTag,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => ContainerLoadingAnimation(
                  height: MediaQuery.of(context).size.height * 0.48,
                  radius: 8,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: imagePath,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(36, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

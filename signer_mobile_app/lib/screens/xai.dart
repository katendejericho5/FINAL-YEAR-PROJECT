import 'package:flutter/material.dart';
import 'package:signer/data/xai_data.dart';
import 'package:signer/screens/xai_details.dart';

class XaiModelsGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XAI Models'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0, // Spacing between items horizontally
                  mainAxisSpacing: 10.0, // Spacing between items vertically
                  childAspectRatio: 0.75,
                ),
                itemCount: xaiModels.length,
                itemBuilder: (context, index) {
                  final model = xaiModels[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => XaiModelDetailsScreen(model),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Hero(
                        tag: 'xai_image_${model.xaiImageAsset}', // Unique tag for each model
                        child: Stack(
                          children: [
                            Image.asset(
                              model.xaiImageAsset,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(123, 0, 0, 0),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  model.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

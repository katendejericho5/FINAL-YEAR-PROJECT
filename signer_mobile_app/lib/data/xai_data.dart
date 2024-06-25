import 'package:signer/models/xai_model.dart';

List<XaiModel> xaiModels = [
  XaiModel(
    xaiImageAsset: 'assets/images/signchild2.jpg',
    name: 'Object Detection Model',
    description:
        'This model uses advanced object detection techniques to identify objects in images and draw bounding boxes around them.',
    moreImages: [
      'assets/images/signchild2.jpg',
      'assets/images/signchild1.jpg',
      'assets/images/signchild2.jpg',
    ],
  ),

  XaiModel(
    xaiImageAsset: 'assets/images/signchild2.jpg',
    name: 'Sentiment Analysis Model',
    description:
        'The sentiment analysis model analyzes text and predicts the sentiment (positive, negative, or neutral) of the content.',
    moreImages: [
      'assets/images/signchild2.jpg',
      'assets/images/signchild2.jpg',
    ],
  ),
  // Add more XAI models as needed
];

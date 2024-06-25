class XaiModel {
  final String xaiImageAsset;
  final String name;
  final String description;
  final List<String> moreImages;

  XaiModel({
    required this.xaiImageAsset,
    required this.name,
    required this.description,
    this.moreImages = const [],
  });
}

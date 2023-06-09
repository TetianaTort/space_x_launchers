class RocketModel {
  final String id;
  final String imageUrl;
  final String wikipediaUrl;

  RocketModel({
    required this.id,
    required this.imageUrl,
    required this.wikipediaUrl,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      id: json['rocket_id'] as String,
      imageUrl:
          (json['flickr_images'] is List && json['flickr_images'].isNotEmpty)
              ? json['flickr_images'][0]
              : '',
      wikipediaUrl: json['wikipedia'] as String,
    );
  }
}

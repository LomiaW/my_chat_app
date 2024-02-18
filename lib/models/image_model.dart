import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpSplashImage {
  String id;
  String? description;
  Urls urls;

  UpSplashImage({
    required this.id,
    required this.urls,
    this.description,
  });

  factory UpSplashImage.fromJson(Map<String, dynamic> json) =>
      _$UpSplashImageFromJson(json);

  Map<String, dynamic> toJson() => _$UpSplashImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Urls {
  String raw;
  String full;
  String regular;
  String small;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small
  });

  factory Urls.fromJson(Map<String, dynamic> json) =>
      _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
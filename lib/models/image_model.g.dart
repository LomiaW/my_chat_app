// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpSplashImage _$UpSplashImageFromJson(Map<String, dynamic> json) =>
    UpSplashImage(
      id: json['id'] as String,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UpSplashImageToJson(UpSplashImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'urls': instance.urls.toJson(),
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
    };

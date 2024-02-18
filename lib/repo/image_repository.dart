import 'dart:convert';
import 'dart:io';
import '../env/env.dart';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ImageRepository {
  Future<List<UpSplashImage>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse(
          'https://api.unsplash.com/photos/?client_id=${Env.imageApiKey}');

      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<UpSplashImage> imageList = decodedList.map((e) {
          return UpSplashImage.fromJson(e);
        }).toList();

        return imageList;
      } else {
        throw Exception('API not available!');
      }
    } on SocketException {
      throw Exception('No internet connection.');
    } on HttpException {
      throw Exception('Could\'t retrieve images.');
    } on FormatException {
      throw Exception('Bad response format.');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}

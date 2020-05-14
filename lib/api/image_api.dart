import 'dart:convert';
import 'package:bloc_practice/models/unsplash_image.dart';
import 'package:http/http.dart' show get;

class ImageAPI {
  Future<List<UnsplashImage>> makeRequest(String query) async {
    List<UnsplashImage> images = [];

    final response = await get(
        'https://api.unsplash.com/search/photos?query=$query&client_id=31ca2e51e29435070d9c66235e4a3b167623aa05fd24fcbf575706e13abef27f');
    final parsedResponse = json.decode(response.body);
    final List results = parsedResponse['results'];
    results.forEach((result) => images.add(UnsplashImage.fromJson(result)));

    return images;
  }
}

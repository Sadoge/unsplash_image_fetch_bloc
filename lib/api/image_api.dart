import 'dart:convert';
import 'package:bloc_practice/api_keys.dart';
import 'package:bloc_practice/models/unsplash_image.dart';
import 'package:http/http.dart' show get;

class ImageAPI {
  Future<List<UnsplashImage>> makeRequest(String query) async {
    List<UnsplashImage> images = [];

    final response = await get(
        'https://api.unsplash.com/search/photos?query=$query&client_id=$unsplash_key');
    final parsedResponse = json.decode(response.body);
    final List results = parsedResponse['results'];
    results.forEach((result) => images.add(UnsplashImage.fromJson(result)));

    return images;
  }
}

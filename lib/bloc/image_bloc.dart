import 'package:bloc_practice/api/image_api.dart';
import 'package:bloc_practice/models/unsplash_image.dart';
import 'package:rxdart/rxdart.dart';

class ImageBloc {
  final ImageAPI api;

  Stream<List<UnsplashImage>> _images = Stream.empty();

  BehaviorSubject<String> _query = BehaviorSubject<String>();

  Stream<List<UnsplashImage>> get images => _images;
  Sink<String> get query => _query;

  ImageBloc(this.api) {
    _images = _query.distinct().asyncMap(api.makeRequest).asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}

import 'package:bloc_practice/api/image_api.dart';
import 'package:bloc_practice/bloc/image_bloc.dart';
import 'package:bloc_practice/image_list.dart';
import 'package:flutter/material.dart';

import 'provider/image_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagesProvider(
      imageBloc: ImageBloc(ImageAPI()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Search',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: ImageSearchPage(),
      ),
    );
  }
}

class ImageSearchPage extends StatelessWidget {
  ImageSearchPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Searcher")),
      body: ImageList(),
      bottomNavigationBar: Container(
        width: 0,
        height: 0,
      ),
    );
  }
}

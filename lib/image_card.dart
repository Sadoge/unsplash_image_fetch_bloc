import 'dart:typed_data';

import 'package:bloc_practice/models/unsplash_image.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class ImageCard extends StatelessWidget {
  final UnsplashImage unsplashImage;

  const ImageCard({Key key, this.unsplashImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  unsplashImage.imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.file_download,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      final result = await Permission.storage.request();
                      if (result.isGranted) {
                        final response = await http.get(unsplashImage.imageUrl);
                        await ImageGallerySaver.saveImage(
                            Uint8List.fromList(response.bodyBytes));
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Image was saved"),
                        ));
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: unsplashImage.description != null ? 10 : 0,
            ),
            unsplashImage.description != null
                ? Text(unsplashImage.description)
                : Container(),
          ],
        ),
      ),
    );
  }
}

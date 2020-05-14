import 'package:bloc_practice/image_card.dart';
import 'package:bloc_practice/provider/image_provider.dart';
import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  ImageList({Key key}) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    final _provider = ImagesProvider.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: _provider.imageBloc.query.add,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search for anything',
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder(
              stream: _provider.imageBloc.images,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: snapshot.data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return ImageCard(
                        unsplashImage: snapshot.data[index],
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

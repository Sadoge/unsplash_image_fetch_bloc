import 'package:bloc_practice/bloc/image_bloc.dart';
import 'package:flutter/material.dart';

class ImagesProvider extends InheritedWidget {
  ImagesProvider({Key key, this.imageBloc, Widget child}) : super(child: child);

  final ImageBloc imageBloc;

  static ImagesProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ImagesProvider>());
  }

  @override
  bool updateShouldNotify(ImagesProvider oldWidget) {
    return true;
  }
}

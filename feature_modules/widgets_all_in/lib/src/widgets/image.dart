import 'dart:io';
import 'package:flutter/material.dart';

/// https://flutter.cn/docs/cookbook/persistence/reading-writing-files
import 'package:path_provider/path_provider.dart' as path_provider;

/// reference https://api.flutter.dev/flutter/widgets/Image-class.html
class ImageView extends StatefulWidget {
  @override
  _ImageView createState() => _ImageView();
}

class _ImageView extends State<ImageView> {
  final String _imageUrl =
      'https://images.unsplash.com/photo-1565898835704-3d6be4a2c98c?fit=crop&w=200&q=60';
  File file;

  @override
  void initState() {
    super.initState();
    // This is the proper place to make the async calls
    // This way they only get called once

    // During development, if you change this code,
    // you will need to do a full restart instead of just a hot reload

    // You can't use async/await here,
    // We can't mark this method as async because of the @override
    _localFile().then((File f) {
      setState(() {
        file = f;
      });
    });
  }

  Future<String> get _localPath async {
    final directory = await path_provider.getApplicationDocumentsDirectory();

    return directory.path;
  }

  // 创建一个指向文件位置的引用
  Future<File> _localFile() async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  @override
  Widget build(BuildContext context) {
    print(file);
    return ListView(
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
        ),
        Image.asset(
          'assets/images/car.jpg',
          // 因为当前图片属于主工程依赖的 widgets_all_in 包文件，所以必须加上 package
          package: 'widgets_all_in',
        ),
        Image(
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        ),
        Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        // Image.file(File(path), scale: 1.0, repeat: ImageRepeat.noRepeat,),
      ],
    );
  }
}

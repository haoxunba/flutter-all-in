import 'dart:io';
import 'package:platform_sdk/platform_sdk.dart';

/// reference https://api.flutter.dev/flutter/widgets/Image-class.html
class WidgetsAllInImage extends StatefulWidget {
  @override
  _WidgetsAllInImage createState() => _WidgetsAllInImage();
}

class _WidgetsAllInImage extends State<WidgetsAllInImage> {
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
    final directory = await getApplicationDocumentsDirectory();

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
          ),
          Image.asset(
            // 全路径引用
            'assets/images/car.jpg',
            // 因为当前图片属于主工程依赖的 widgets_all_in 包文件，所以必须加上 package
            package: 'widgets_all_in',
          ),
          Image(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          ),
          // final ImageProvider image;
          // 实现 ImageProvider 的有 FileImageMemory ImageNetwork ImageResizeImage
          // FileImageMemoryImage NetworkImageResizeImage
          Image(
            image: AssetImage(
              'assets/images/car.jpg',
              package: 'widgets_all_in',
            ),
          ),
          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          // Image.file(File(path), scale: 1.0, repeat: ImageRepeat.noRepeat,),
        ],
      ),
    );
  }
}

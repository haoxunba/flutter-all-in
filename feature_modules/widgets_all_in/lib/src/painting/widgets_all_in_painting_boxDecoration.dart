import 'package:flutter/material.dart';

/// Row 和 Column 都属于 flex box
class WidgetsAllInPaintingBoxDecoration extends StatefulWidget {
  @override
  _WidgetsAllInPaintingBoxDecoration createState() =>
      _WidgetsAllInPaintingBoxDecoration();
}

class _WidgetsAllInPaintingBoxDecoration
    extends State<WidgetsAllInPaintingBoxDecoration> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painting BoxDecoration'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                child: Text('BoxDecoration color'),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Text('BoxDecoration shape'),
              decoration: BoxDecoration(
                color: Colors.yellow,
                // default value BoxShape.rectangle,
                // 只有在 shape 是长方形是，才会设置 borderRadius
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Text('BoxDecoration border'),
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(width: 10, color: Colors.blue),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Text('BoxDecoration borderRadius'),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Text('BoxDecoration border borderRadius'),
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(width: 10, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Text('BoxDecoration gradient'),
              decoration: BoxDecoration(
                // 此时设置 color 没效果的
                // color: Colors.yellow,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.yellow,
                    Colors.blue,
                  ], // whitish to gray
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Text('BoxDecoration gradient'),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              // 必须设置宽高才能显示图片
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/car.jpg',
                    package: 'widgets_all_in',
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

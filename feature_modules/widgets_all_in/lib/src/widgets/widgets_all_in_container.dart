import 'package:flutter/material.dart';

class WidgetsAllInContainer extends StatefulWidget {
  @override
  _WidgetsAllInContainer createState() => _WidgetsAllInContainer();
}

class _WidgetsAllInContainer extends State<WidgetsAllInContainer> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Widget"),
      ),
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),

          /// 上面的Container为什么width不生效，下面的width就生效了
          ///
          /// Constraints in Flutter works a bit different than usual.
          /// Widgets themselves do not have constraints.
          /// When you specify a width/height on a Container,
          /// you're not constraining Container.
          /// You're constraining the child of Container.
          /// https://stackoverflow.com/questions/54717748/why-flutter-container-does-not-respects-its-width-and-height-constraints-when-it
          ///
          /// Container doesn't know the constraints of the Parent,
          /// then It try to fill all the space available.
          /// https://stackoverflow.com/questions/54225462/flutter-why-is-container-width-not-honoured/54225592
          ///
          /// 这里牵涉到BoxConstraints的底层问题，知乎专栏https://zhuanlan.zhihu.com/p/41801871
          /// 这也就解释了因为 ListView的约束，所以上面的Container高度就生效了
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.deepOrange,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.grey,
              ),
            ],
          ),
          Container(
            /// 通过 padding 和 constraints 约束 child 的空间范围
            constraints: BoxConstraints.expand(
              height: 200.0,
            ),
            padding: const EdgeInsets.all(50.0),
            color: Colors.pink,
            alignment: Alignment.center,
            child: Container(
              child: Text('Child'),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue[600],
            alignment: Alignment.center,
            child: Text('Hello World',
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(0.1),
          ),
          Container(
            child:
                Image.asset('assets/images/car.jpg', package: 'widgets_all_in'),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: AssetImage('assets/images/car.jpg',
                    package: 'widgets_all_in'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.black,
                width: 9,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          )
        ],
      ),
    );
  }
}

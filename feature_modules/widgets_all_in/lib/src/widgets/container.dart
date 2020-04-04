import 'package:flutter/material.dart';

class ContainerView extends StatefulWidget {
  @override
  _ContainerView createState() => _ContainerView();
}

class _ContainerView extends State<ContainerView> {
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

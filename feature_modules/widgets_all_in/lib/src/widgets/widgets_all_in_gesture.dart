import 'package:platform_sdk/platform_sdk.dart';

/// By default a GestureDetector with an invisible child ignores touches; this behavior can be controlled with behavior.
/// Material design applications typically react to touches with ink splash effects.
/// The [InkWell] class implements this effect and can be used in place of a GestureDetector for handling taps.
class WidgetsAllInGestureDetector extends StatefulWidget {
  @override
  _WidgetsAllInGestureDetector createState() => _WidgetsAllInGestureDetector();
}

class _WidgetsAllInGestureDetector extends State<WidgetsAllInGestureDetector> {
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Widget"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(list[index]);
        },
      ),
      floatingActionButton: GestureDetector(
        // https://flutter.cn/docs/development/ui/advanced/gestures
        onTapDown: (details) {
          setState(() {
            list.add(
                'onTapDown-globalPosition: ${details.globalPosition}-localPosition: ${details.localPosition}-kind: ${details.kind.toString()}');
          });
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          setState(() {
            list.add(
                'onTapUp-globalPosition: ${tapUpDetails.globalPosition}-localPosition: ${tapUpDetails.localPosition}');
          });
        },
        onTap: () {
          setState(() {
            list.add('onTap');
          });
        },
        onTapCancel: () {
          setState(() {
            list.add('onTapCancel');
          });
        },
        onLongPress: () {
          setState(() {
            list.add('onLongPress');
          });
        },
        // onPan会监听纵向和横向滚动，单独监听一个方向可以使用
        // onVerticalDragStart onVerticalDragUpdate onVerticalDragEnd
        // onHorizontalDragStart onHorizontalDragStart onHorizontalDragEnd
        // 使用onPan方法就不能同时使用onVerticalDrag或onHorizontalDrag
        onPanStart: (DragStartDetails details) {
          list.add(
              'onPanStart-globalPosition: ${details.globalPosition}-localPosition: ${details.localPosition}-sourceTimeStamp: ${details.sourceTimeStamp.toString()}');
        },
        onPanUpdate: (DragUpdateDetails details) {
          list.add(
              'onPanUpdate-globalPosition: ${details.globalPosition}-localPosition: ${details.localPosition}-delta: ${details.delta}-primaryDelta: ${details.primaryDelta}-sourceTimeStamp: ${details.sourceTimeStamp.toString()}');
        },
        onPanEnd: (DragEndDetails details) {
          list.add(
              'onPanEnd-velocity: ${details.velocity}-primaryVelocity: ${details.primaryVelocity}');
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.pink,
        ),
      ),
    );
  }
}

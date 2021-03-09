import 'package:platform_sdk/platform_sdk.dart';

class WidgetAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }
}

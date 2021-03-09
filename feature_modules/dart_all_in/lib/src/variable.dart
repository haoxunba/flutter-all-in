import 'package:platform_sdk/platform_sdk.dart';

class DartVariable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var constantList = const [1, 2, 3];
    // constantList[1] = 1; // 运行时报错
    return Container();
  }
}

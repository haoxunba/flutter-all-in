import 'package:flutter_test/flutter_test.dart';
// 当前test只会对导入的文件执行测试
import 'package:tests_all_in/widget/flutter_test_simple.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // pumpWidget 方法会建立并渲染我们提供的 widget。
    await tester.pumpWidget(TestWidgetAllInSimple(title: 'T', message: 'M'));
    // 通过Finder类查找widget
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

// Widget-specific `Matcher` 常量，该常量在测试环境下帮助我们验证 Finder 是否定位到一个或多个 widgets。如`findsOneWidget`
// - `findOneWidget` 在屏幕中只出现一次
// - `findsNothing` 验证没有可被查找的 widgets。
// - `findsWidgets` 验证一个或多个 widgets 被找到。
// - `findsNWidgets` 验证特定数量的 widgets 被找到。
// - `isTrue` 验证布尔值 true。
// - `isFalse` 验证布尔值 false。
// - `isNull` A matcher that matches any null value.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}

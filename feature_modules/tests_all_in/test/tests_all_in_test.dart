import 'package:flutter_test/flutter_test.dart';

import 'package:tests_all_in/tests_all_in.dart';

// 所有的测试都要以 _test 结尾才会被执行
void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}

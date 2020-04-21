import 'package:platform_sdk/platform_sdk.dart';
import 'dart:convert';

class FunctionJsonSerialize extends StatelessWidget {
  _dartConvert() {
    var json = {"name": "John Smith", "email": "john@example.com"};
    var jsonString = '{"name": "John Smith", "email": "john@example.com"}';
    Map<String, dynamic> user = jsonDecode(jsonString);

    print('Howdy, ${user['name']}!');
    print('We sent the verification link to ${user['email']}.');
  }

  @override
  Widget build(BuildContext context) {
    _dartConvert();
    return Scaffold(
      appBar: AppBar(
        title: Text('Function Json Serialize'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(''),
          ],
        ),
      ),
    );
  }
}

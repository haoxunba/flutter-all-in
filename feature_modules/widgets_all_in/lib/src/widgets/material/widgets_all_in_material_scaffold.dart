import 'package:flutter/material.dart';

/// Row 和 Column 都属于 flex box
class WidgetsAllInMaterialScaffold extends StatefulWidget {
  @override
  _WidgetsAllInMaterialScaffold createState() =>
      _WidgetsAllInMaterialScaffold();
}

class _WidgetsAllInMaterialScaffold
    extends State<WidgetsAllInMaterialScaffold> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),

      /// 自动调整body的大小，防止系统键盘遮盖 body 上面的 widgets，默认为true
      /// TextFormField 配合下面的 TextFormField 来验证 false 的情况
      // resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('You have pressed the button $_count times.'),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

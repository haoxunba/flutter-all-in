import 'package:flutter/material.dart';

class WidgetsAllInForm extends StatefulWidget {
  @override
  _WidgetsAllInForm createState() => _WidgetsAllInForm();
}

class _WidgetsAllInForm extends State<WidgetsAllInForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Widget"),
      ),
      body: ListView(
        children: <Widget>[
          _ValidateForm(),
          _MyCustomForm(),
          _FocusForm(),
          _RetrieveTextForm(),
        ],
      ),
    );
  }
}

// 检验文本框
class _ValidateForm extends StatelessWidget {
  /// Form 的 child widget 通过 _formKey.currentState 获取 FormState
  /// Call methods on FormState to save, reset, or validate each FormField
  /// 嵌套组件且组件树比较复杂的情况下，可以使用 Form.of() 方法访问表单。
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// TextFormField 内部封装了一个 TextField 并被集成在表单组件 Form 中。
          /// 如果需要对文本输入进行验证或者需要与其他表单组件 FormField 交互联动，
          /// 可以考虑使用 TextFormField。
          TextFormField(
            // InputDecoration 自定义装饰样式（添加标签、图标、提示文本和错误文本）
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                /// TextFormField 的 validator 方法不会自动触发，只有在这里手动触发验证
                /// 或者在 onChange 进行实时自动方法触发
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

/// 响应文本框内容的更改
/// https://flutter.cn/docs/cookbook/forms/text-field-changes
class _MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<_MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          // 通过 onChanged 方法实时响应文本框输入
          TextField(
            onChanged: (text) {
              print("First text field: $text");
            },
          ),
          // 通过 TextEditingController 方法实时响应文本框输入
          TextField(
            controller: myController,
          ),
        ],
      ),
    );
  }
}

/// 自动获得焦点
/// 例如，假设我们有一个带有文本框的搜索页面。当用户导航到搜索页面时，
/// 我们可以聚焦文本框的搜索项。这将允许用户在搜索页面可见时能够立即开始输入，
/// 而无需手动点击文本框。
class _FocusForm extends StatefulWidget {
  @override
  _FocusFormState createState() => _FocusFormState();
}

class _FocusFormState extends State<_FocusForm> {
  /// 由于 focus node 是长寿命对象，我们需要使用 State 类来管理生命周期。
  /// 为此，需要在 State 类的 initState 方法中创建 FocusNode 实例，
  /// 并在 dispose 方法中清除它们。
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    // Here's the workaround 解决办法 : schedule a post-frame callback to set the focus.
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // The first text field is focused on as soon as the app starts.
          TextField(
            autofocus: true,
          ),
          // The second text field is focused on when a user taps the
          // FloatingActionButton.
          TextField(
            focusNode: myFocusNode,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                myFocusNode.requestFocus();
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

// 获取文本框内容
class _RetrieveTextForm extends StatefulWidget {
  @override
  _RetrieveTextFormState createState() => _RetrieveTextFormState();
}

class _RetrieveTextFormState extends State<_RetrieveTextForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(myController.text),
                    );
                  },
                );
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

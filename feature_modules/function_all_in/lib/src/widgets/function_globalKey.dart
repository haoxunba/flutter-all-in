import 'package:flutter/material.dart';

// 如果要在外部改变该状态，这时候就需要使用 GlobalKey。
class FunctionGlobalKey extends StatefulWidget {
  @override
  _FunctionGlobalKey createState() => _FunctionGlobalKey();
}

class _FunctionGlobalKey extends State<FunctionGlobalKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GlobalKey Widget"),
      ),
      body: FunctionAllInGlobalKeyScreen(),
    );
  }
}

class FunctionAllInGlobalKeyScreen extends StatefulWidget {
  @override
  _FunctionAllInGlobalKeyScreenState createState() =>
      _FunctionAllInGlobalKeyScreenState();
}

class _FunctionAllInGlobalKeyScreenState
    extends State<FunctionAllInGlobalKeyScreen> {
  final GlobalKey<SwitcherScreenState> key = GlobalKey<SwitcherScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitcherScreen(
        key: key,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        key.currentState.changeState();
      }),
    );
  }
}

class SwitcherScreen extends StatefulWidget {
  // 如果不写super(key: key)，会导致当前工程有bug，
  // 点击floatingActionButton按钮key.currentState是null
  SwitcherScreen({Key key}) : super(key: key);
  @override
  SwitcherScreenState createState() => SwitcherScreenState();
}

class SwitcherScreenState extends State<SwitcherScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch.adaptive(
            value: isActive,
            onChanged: (bool currentStatus) {
              isActive = currentStatus;
              setState(() {});
            }),
      ),
    );
  }

  changeState() {
    isActive = !isActive;
    setState(() {});
  }
}

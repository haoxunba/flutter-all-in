import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class PluginRubberDismissablePage extends StatefulWidget {
  PluginRubberDismissablePage({Key key}) : super(key: key);

  @override
  _PluginRubberDismissablePage createState() => _PluginRubberDismissablePage();
}

class _PluginRubberDismissablePage extends State<PluginRubberDismissablePage>
    with SingleTickerProviderStateMixin {
  RubberAnimationController _controller;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _controller = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(percentage: 0.1),
        upperBoundValue: AnimationControllerValue(percentage: 0.9),
        duration: Duration(milliseconds: 200),
        // if true, when the bottomsheet reaches the lowerbound the animation stops
        dismissable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dismissable",
          style: TextStyle(color: Colors.cyan[900]),
        ),
      ),
      body: Container(
        child: RubberBottomSheet(
          onDragEnd: () {
            print("onDragEnd");
          },
          scrollController: _scrollController,
          lowerLayer: _getLowerLayer(),
          upperLayer: _getUpperLayer(),
          animationController: _controller,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.expand();
        },
      ),
    );
  }

  Widget _getLowerLayer() {
    return Container(
      decoration: BoxDecoration(color: Colors.cyan[100]),
    );
  }

  Widget _getUpperLayer() {
    return Container(
      decoration: BoxDecoration(color: Colors.cyan),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("Item $index"));
          },
          itemCount: 20),
    );
  }
}

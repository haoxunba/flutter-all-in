import 'package:flutter/material.dart';
import 'package:function_all_in/function_all_in.dart';
import 'package:widgets_all_in/widgets_all_in.dart';
import 'package:plugins_all_in/plugins_all_in.dart';

List<Widget> buildAppModules() {
  return [
    WidgetsAllIn(),
    PluginsAllIn(),
    FunctionAllIn(),
  ];
}

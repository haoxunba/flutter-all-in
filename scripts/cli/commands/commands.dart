import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
// import 'package:recase/recase.dart';

import '../common.dart';

class RunCommand extends Command<Null> {
  RunCommand() : super();

  @override
  String get description => 'integration commands';

  @override
  String get name => 'run';

  @override
  FutureOr<Null> run() async {
    final target = '${Directory.current.path}/lib/main.dart';

    await runAndStream(
      flutterBin,
      <String>['run', '--target', target],
      workingDir: Directory.current,
    );
  }
}

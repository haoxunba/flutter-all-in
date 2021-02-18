import 'dart:async';
import 'dart:io';
import 'package:args/command_runner.dart';
import '../common.dart';

class GetPackagesCommand extends Command<Null> {
  static const String _quick = 'quick';
  static const String _noCn = 'no-cn';

  GetPackagesCommand() {
    argParser.addFlag(
      _quick,
      help: 'Do not fetch the sandbox dependencies.',
    );
    argParser.addFlag(
      _noCn,
      help: 'Do not fetch the china dependencies.',
    );
  }

  @override
  String get description =>
      'runs "flutter get packages" on all the packages found in the project';

  @override
  String get name => 'getPackages';

  final String filename = 'getpackages_log.txt';

  @override
  FutureOr<Null> run() async {
    var stopwatch = Stopwatch()..start();
    final quick = argResults[_quick] ?? false;
    final noCn = argResults[_noCn] ?? false;

    final packageDirs = getAllPackagesInProject()
        .where((dir) =>
            dir.path != null &&
            (!quick || !dir.path.contains('sandbox')) &&
            (!noCn || !dir.path.contains('_cn')))
        .toList();
    final futures = <Future>[];

    for (var index = 0; index < packageDirs.length; index++) {
      futures.add(runAndStream(
        flutterBin,
        ['packages', 'get'],
        workingDir: packageDirs[index],
      ));

      if ((index + 1) % 10 == 0 || (index + 1) == packageDirs.length) {
        await Future.wait(
          futures,
          eagerError: false,
        );
        stdout.writeln(
            '${((index + 1) / packageDirs.length * 100).round()}% done.');
        futures.clear();
      }
    }

    final totalExecutionTime = stopwatch.elapsed;
    final commandExecuted =
        name + (quick ? " --quick" : "") + (noCn ? " --no-cn" : "");

    await saveLog(totalExecutionTime, commandExecuted);

    print(
        '$name executed in $totalExecutionTime. Log saved to ${Directory.current.path}\\$filename');

    return null;
  }

  Future<File> saveLog(
    Duration totalExecutionTime,
    String commandExecuted,
  ) async {
    final file = File(filename);

    return await file.writeAsString(
      '$commandExecuted was executed on ${DateTime.now()} in $totalExecutionTime.\n',
      mode: FileMode.append,
    );
  }
}

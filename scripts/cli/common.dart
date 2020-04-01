import 'dart:io';

// It returns the proper Flutter script binary name according with OS
String get flutterBin => Platform.isWindows ? 'flutter.bat' : 'flutter';

/// It runs the given [executable] command with the different [args] passed.
/// If the command needs to be executed on a certain [Directory], you can use an
/// optional [workingDir]; if you want to exit when an error is found, set
/// [exitOnError] to `true`.
Future<int> runAndStream(String executable, List<String> args,
    {Directory workingDir, bool exitOnError = false}) async {
  print('executable $executable args: $args');
  final process =
      await Process.start(executable, args, workingDirectory: workingDir?.path);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  return process.exitCode;
}

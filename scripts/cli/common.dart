import 'dart:async';
import 'dart:io';

class ToolExit extends Error {
  ToolExit(this.exitCode);

  final int exitCode;
}

String _getErrorString(String executable, List<String> args,
    {Directory workingDir}) {
  final workdir = workingDir == null ? '' : ' in ${workingDir.path}';
  return 'ERROR: Unable to execute "$executable ${args.join(' ')}"$workdir.';
}

/// It runs the given [executable] command with the different [args] passed.
/// If the command needs to be executed on a certain [Directory], you can use an
/// optional [workingDir]; if you want to exit when an error is found, set
/// [exitOnError] to `true`.
/// [printExecutionCommandPreview], [attachStdOut] and [attachStdErr] are
/// enabled by default, but you can change them to the intended behavior.
Future<int> runAndStream(
  String executable,
  List<String> args, {
  Directory workingDir,
  bool exitOnError = false,
  bool printExecutionCommandPreview = true,
  bool attachStdOut = true,
  bool attachStdErr = true,
}) async {
  if (printExecutionCommandPreview) {
    print('executable $executable args: $args');
  }

  final process =
      await Process.start(executable, args, workingDirectory: workingDir?.path);

  StreamSubscription<List<int>> subStdOut;
  StreamSubscription<List<int>> subStdErr;

  final processStdOut = <int>[];
  final processStdErr = <int>[];

  if (attachStdOut) {
    subStdOut = process.stdout.listen(processStdOut.addAll);
  }

  if (attachStdErr) {
    subStdErr = process.stderr.listen(processStdErr.addAll);
  }

  final exitCode = await process.exitCode;

  if (subStdOut != null) {
    subStdOut.cancel();
  }

  if (subStdErr != null) {
    subStdErr.cancel();
  }

  stdout.add(processStdOut);
  stderr.add(processStdErr);

  if (exitOnError && exitCode != 0) {
    final error = _getErrorString(executable, args, workingDir: workingDir);
    print('$error See above for details.');
    throw ToolExit(exitCode);
  }

  return exitCode;
}

// It returns the proper Flutter script binary name according with OS
String get flutterBin => Platform.isWindows ? 'flutter.bat' : 'flutter';

/// It returns all the [pubspec.yaml] found under this project
Iterable<FileSystemEntity> getAllPubspecsInProject() {
  final projectRoot = Directory(Directory.current.path);
  return projectRoot
      .listSync(recursive: true, followLinks: false)
      .whereType<File>()
      .where((entity) => entity.path.contains('pubspec.yaml'));
}

/// It returns all the [Directory] that contain a [pubspec.yaml]
Iterable<Directory> getAllPackagesInProject() {
  return getAllPubspecsInProject().map((file) {
    if (file.path.contains('.git')) {
      return null;
    }
    final packagePath = file.path.replaceAll(RegExp('pubspec.yaml'), '');
    return Directory(packagePath);
  }).where((dir) => dir != null);
}

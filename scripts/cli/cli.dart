import 'package:args/command_runner.dart';
import './commands/commands.dart';

void main(List<String> args) {
  final commandRunner = CommandRunner<Null>(
      'dart ./scripts/cli/cli.dart', 'intergration command line interface')
    ..addCommand(GetPackagesCommand());

  commandRunner.run(args);
}

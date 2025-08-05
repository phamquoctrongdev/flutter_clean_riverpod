import 'dart:io';

const requiredVersion = '3.29.1';
const useFvm = true;

String get flutter => useFvm ? 'fvm flutter' : 'flutter';

String get dart => useFvm ? 'fvm dart' : 'dart';

Future<void> runCommand(String command, {bool exitOnError = true}) async {
  stdout.writeln('\x1B[34m🚀 $command\x1B[0m');
  final result = await Process.run(Platform.isWindows ? 'cmd' : 'bash', [
    Platform.isWindows ? '/c' : '-c',
    command,
  ]);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  if (result.exitCode != 0 && exitOnError) {
    stderr.writeln('\x1B[31m❌ Command failed: $command\x1B[0m');
    exit(result.exitCode);
  }
}

Future<String> getFlutterVersion() async {
  final result = await Process.run(Platform.isWindows ? 'cmd' : 'bash', [
    Platform.isWindows ? '/c' : '-c',
    '$flutter --version',
  ]);
  final versionLine = result.stdout
      .toString()
      .split('\n')
      .firstWhere((line) => line.contains('Flutter'), orElse: () => '');
  final match = RegExp(r'Flutter (\d+\.\d+\.\d+)').firstMatch(versionLine);
  return match?.group(1) ?? '';
}

bool isVersionHigher(String current, String required) {
  final c = current.split('.').map(int.parse).toList();
  final r = required.split('.').map(int.parse).toList();

  for (int i = 0; i < 3; i++) {
    if (c[i] > r[i]) return true;
    if (c[i] < r[i]) return false;
  }
  return true;
}

Future<void> main() async {
  final currentVersion = await getFlutterVersion();

  if (isVersionHigher(requiredVersion, currentVersion)) {
    stderr.writeln(
      '\x1B[31m❌ Flutter version $requiredVersion is required. You have $currentVersion\x1B[0m',
    );
    exit(1);
  }

  stdout.writeln('\x1B[32m✔ Correct Flutter version: $currentVersion\x1B[0m');

  await runCommand('$flutter clean');
  await runCommand('$flutter pub get');
  await runCommand(
    '$dart run easy_localization:generate -S assets/translations',
  );
  await runCommand(
    '$dart run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart',
  );
  await runCommand('$dart run build_runner build -d');

  stdout.writeln('\x1B[32m🎉 All tasks completed successfully!\x1B[0m');
}

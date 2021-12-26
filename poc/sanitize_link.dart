import 'package:downloader/src/helpers/helpers.dart';

const path = "./../resource/img/240x240/loading.png";

void main() {
  final sanitized = SanitizePathHelper.sanitize(path);
  print(sanitized);
  final fileName = SanitizePathHelper.fileNameFromPath(path);
  print(fileName);
  final pathOnly = SanitizePathHelper.pathOnly(sanitized);
  print(pathOnly);
}

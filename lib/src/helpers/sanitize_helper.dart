abstract class SanitizePathHelper {
  SanitizePathHelper._();

  static String sanitize(String path) {
    final regx = RegExp('(?:(./)|(../))+');
    return path.replaceFirst(regx, '');
  }

  static String? fileNameFromPath(String path) {
    const regx = r'(?<=\/)[^\/\?#]+(?=[^\/]*$)';
    return RegExp(regx).stringMatch(path);
  }

  static String pathOnly(String path) {
    final exclude = fileNameFromPath(path);
    return path.replaceAll('/$exclude', '');
  }
}

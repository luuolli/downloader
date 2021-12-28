import 'package:downloader/src/helpers/helpers.dart';

import '../../domain/domain.dart';

class AssetsManager implements IAssetsManager {
  List<Map<String, String>>? _assetsMap;

  @override
  List<Map<String, String>> get assetsMap => _assetsMap ?? [];

  @override
  void prepare(
    List<String> paths,
    String baseUrl, {
    required Function onComplete,
  }) {
    _assetsMap = paths.map((path) {
      final sanitized = SanitizePathHelper.sanitize(path);
      final _fileName = SanitizePathHelper.fileNameFromPath(sanitized);
      final _fileUrl = "$baseUrl/$sanitized";
      return {"name": _fileName!, "link": _fileUrl};
    }).toList();
    onComplete();
  }
}

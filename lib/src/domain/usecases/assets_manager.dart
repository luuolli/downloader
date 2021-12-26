abstract class IAssetsManager {
  List<String> get tempPaths;

  List<Map<String, String>> get assetsMap;

  void prepare(List<String> paths);
}

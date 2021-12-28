abstract class IAssetsManager {
  List<Map<String, String>> get assetsMap;

  void prepare(
    List<String> paths,
    String baseUrl, {
    required Function onComplete,
  });
}

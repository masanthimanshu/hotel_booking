import 'package:http/http.dart' as http;

mixin HTTPRequests {
  Future<String?> getRequest(String url) async {
    final uri = Uri.parse(url);
    final res = await http.get(uri);

    if (res.statusCode >= 200 && res.statusCode <= 208) {
      final json = res.body;
      return json;
    }

    return null;
  }

  Future<String?> postRequest({
    required String url,
    required Object payload,
  }) async {
    final uri = Uri.parse(url);
    final res = await http.post(
      uri,
      body: payload,
      headers: {"Content-Type": "application/json"},
    );

    if (res.statusCode >= 200 && res.statusCode <= 208) {
      final json = res.body;
      return json;
    }

    return null;
  }
}

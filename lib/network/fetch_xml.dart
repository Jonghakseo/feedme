import 'package:http/http.dart' as http;

class FetchXml {
  static bool _isValidResponse(http.Response response) {
    if (response.statusCode != 200) return false;

    String contentType = response.headers['content-type'].toString();
    if (!contentType.contains('xml')) return false;

    return true;
  }

  static Future<String> fetchRssXml(String uri) async {
    http.Response response = await http.get(Uri.parse(uri));
    if (!_isValidResponse(response)) {
      throw Error();
    }
    return response.body;
  }
}

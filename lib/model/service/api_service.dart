import 'package:http/http.dart' as http;

class ApiService {
  String _baseUrl = 'https://hn.algolia.com/api/v1';

  Future<String> get({String query}) async {
    try {
      var response = await http.get(
        Uri.parse('$_baseUrl/$query'),
      );

      return response.body;
    } catch (e) {
      return null;
    }
  }
}

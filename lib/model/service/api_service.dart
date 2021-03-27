import 'package:http/http.dart' as http;

class ApiService {
  String _baseUrl = '';

  Future<String> get({String query}) async {
    try {
      var response = await http.get(
        Uri(scheme: '$_baseUrl/$query'),
      );

      return response.body;
    } catch (e) {
      return null;
    }
  }
}

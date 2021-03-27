import 'package:flutter/foundation.dart';
import 'package:hacker_news/model/data_model/search_response.dart';
import 'package:hacker_news/model/service/api_service.dart';

class NewsService {
  ApiService _service = ApiService();

  Future<SearchResponse> doSearch({@required String query}) async {
    String resp = await _service.get(query: '$query');
    try {
      return searchResponseFromJson(resp);
    } on Exception {
      return null;
    }
  }
}

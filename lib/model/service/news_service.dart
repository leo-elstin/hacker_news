import 'package:flutter/foundation.dart';
import 'package:hacker_news/model/data_model/news_details.dart';
import 'package:hacker_news/model/data_model/search_response.dart';
import 'package:hacker_news/model/service/api_service.dart';

/// class that handles the news related api calls
class NewsService {
  ApiService _service = ApiService();

  // search query api path
  String _searchPath = 'search?query=';

  // details api path
  String _detailsPath = '/items/';

  /// Method to get the news details based on [query]
  /// where [query] is a required argument and it returns back the [SearchResponse]
  /// on api success
  Future<SearchResponse> doSearch({@required String query}) async {
    String resp = await _service.get(query: '$_searchPath$query');
    try {
      return searchResponseFromJson(resp);
    } on Exception {
      // todo handle the failure case
      return null;
    }
  }

  /// Method to get the news details based on [id]
  /// where [id] is a required argument and it returns back the [DetailsResponse]
  /// on api success
  Future<DetailsResponse> details({@required String id}) async {
    String resp = await _service.get(query: '$_detailsPath/$id');
    try {
      return detailsResponseFromJson(resp);
    } on Exception {
      // todo handle the failure case
      return null;
    }
  }
}

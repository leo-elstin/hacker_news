import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hacker_news/model/data_model/news.dart';
import 'package:hacker_news/model/data_model/search_response.dart';
import 'package:hacker_news/model/service/news_service.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NewsService service;

  SearchBloc({this.service}) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is Search) {
      yield Searching();
      SearchResponse response = await service.doSearch(query: '${event.query}');
      List<News> news = response.hits
          .map((e) => News(
              title: e.title,
              author: e.author,
              url: e.url,
              id: e.objectId,
              commentsCount: e.numComments,
              description: ''))
          .toList();
      yield Searched(news: news);
    }

    if (event is OpenDetailsEvent) {
      yield OpenDetailsState(event.id);
    }

    if (event is Reset) {
      yield SearchInitial();
    }
  }
}

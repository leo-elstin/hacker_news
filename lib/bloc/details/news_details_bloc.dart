import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hacker_news/model/data_model/news_details.dart';
import 'package:hacker_news/model/service/news_service.dart';
import 'package:meta/meta.dart';

part 'news_details_event.dart';

part 'news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  NewsDetailsBloc() : super(NewsDetailsInitial());

  @override
  Stream<NewsDetailsState> mapEventToState(
    NewsDetailsEvent event,
  ) async* {
    if (event is GetDetails) {
      yield FetchingDetails();
      DetailsResponse response = await NewsService().details(id: event.id);
      yield NewsDetailsFetched(response);
    }
  }
}

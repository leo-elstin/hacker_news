import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_details_event.dart';
part 'news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  NewsDetailsBloc() : super(NewsDetailsInitial());

  @override
  Stream<NewsDetailsState> mapEventToState(
    NewsDetailsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

part of 'news_details_bloc.dart';

@immutable
abstract class NewsDetailsState {}

class NewsDetailsInitial extends NewsDetailsState {}

class FetchingDetails extends NewsDetailsState {

}

class NewsDetailsFetched extends NewsDetailsState {

}

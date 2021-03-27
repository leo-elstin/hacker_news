part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class Searching extends SearchState {}

class Searched extends SearchState {
  final List<News> news;

  Searched({this.news});
}

class SearchFailed extends SearchState {}
class OpenDetailsState extends SearchState {}

part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class Search extends SearchEvent {
  final String query;

  Search({this.query});
}

class Reset extends SearchEvent {}

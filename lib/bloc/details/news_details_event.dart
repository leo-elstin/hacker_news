part of 'news_details_bloc.dart';

@immutable
abstract class NewsDetailsEvent {}

class GetDetails extends NewsDetailsEvent {
  final String id;

  GetDetails(this.id);
}

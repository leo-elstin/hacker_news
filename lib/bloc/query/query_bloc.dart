import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'query_event.dart';
part 'query_state.dart';

class QueryBloc extends Bloc<QueryEvent, QueryState> {
  QueryBloc() : super(QueryInitial());

  @override
  Stream<QueryState> mapEventToState(
    QueryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

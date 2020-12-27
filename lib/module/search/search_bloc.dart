import 'package:arman/data/data_repository.dart';
import 'package:arman/model/news.dart';
import 'package:arman/model/response_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchStatus { initial, success, failed, loading }

class SearchState extends Equatable {
  List<News> data;
  String message;
  SearchStatus status;

  SearchState({
    this.data = const [],
    this.message = "",
    this.status = SearchStatus.initial,
  });

  @override
  List<Object> get props => [data, message, status];

  @override
  bool get stringify => true;

  SearchState copyWith({
    List<News> data,
    String message,
    SearchStatus status,
  }) {
    return SearchState(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class KeyWordSearchEvent extends SearchEvent {
  final String keyword;

  KeyWordSearchEvent({this.keyword});
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  DataRepository dataRepository = DataRepository();
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is KeyWordSearchEvent) {
      yield state.copyWith(
        status: SearchStatus.loading,
        data: [],
        message: "",
      );
      ResponseData responseData =
          await dataRepository.fetchSearch(event.keyword);
      print(responseData.toString());
      if (responseData != null) {
        yield state.copyWith(
          status: SearchStatus.success,
          data: responseData.data,
          message: "Data retrieve success",
        );
      }
    }
  }
}

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/item_recommendation.dart';
import 'package:arman/model/respondata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchStatus { initial, success, failed }

class SearchState extends Equatable {
  List<ItemRecommendation> data;
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
    List<ItemRecommendation> data,
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
      print("searching");
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

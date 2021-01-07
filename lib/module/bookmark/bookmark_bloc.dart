import 'package:arman/data/data_repository.dart';
import 'package:arman/model/response_data.dart';
import 'package:equatable/equatable.dart';

import 'package:arman/model/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BookmarkStatus { initial, success, failure }

class BookmarkState extends Equatable {
  BookmarkStatus status;
  List<News> data;
  String message;

  BookmarkState({
    this.status = BookmarkStatus.initial,
    this.data = const [],
    this.message = "",
  });

  @override
  List<Object> get props => [status, data, message];

  @override
  bool get stringify => true;

  BookmarkState copyWith({
    BookmarkStatus status,
    List<News> data,
    String message,
  }) {
    return BookmarkState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

class BookmarkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  DataRepository dataRepository = DataRepository();

  BookmarkBloc() : super(BookmarkState());

  @override
  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async* {
    ResponseData responseData = await dataRepository.fetchBookmarks();
    if (responseData.success) {
      yield state.copyWith(
        data: responseData.data,
        status: BookmarkStatus.success,
        message: "",
      );
    }
  }
}

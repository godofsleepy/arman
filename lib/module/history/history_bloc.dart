import 'package:arman/data/data_repository.dart';
import 'package:arman/model/response_data.dart';
import 'package:equatable/equatable.dart';

import 'package:arman/model/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum HistoryStatus { initial, success, failure }

class HistoryState extends Equatable {
  HistoryStatus status;
  List<News> data;
  String message;

  HistoryState({
    this.status = HistoryStatus.initial,
    this.data = const [],
    this.message = "",
  });

  @override
  List<Object> get props => [status, data, message];

  @override
  bool get stringify => true;

  HistoryState copyWith({
    HistoryStatus status,
    List<News> data,
    String message,
  }) {
    return HistoryState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

class HistoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  DataRepository dataRepository = DataRepository();

  HistoryBloc() : super(HistoryState());

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    ResponseData responseData = await dataRepository.fetchHistories();
    if (responseData.success) {
      yield state.copyWith(
        data: responseData.data,
        status: HistoryStatus.success,
        message: "",
      );
    }
  }
}

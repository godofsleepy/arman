import 'package:arman/data/data_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:arman/model/response_category.dart';
import 'package:arman/model/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ExploreTopicStatus { initial, success, failure }

class ExploreTopicState extends Equatable {
  ExploreTopicStatus status;
  List<Topic> data;
  String message;

  ExploreTopicState({
    this.status,
    this.data,
    this.message,
  });

  @override
  List<Object> get props => [status, data, message];

  @override
  bool get stringify => true;

  ExploreTopicState copyWith({
    ExploreTopicStatus status,
    List<Topic> data,
    String message,
  }) {
    return ExploreTopicState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

class ExploreTopicEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExploreTopicBloc extends Bloc<ExploreTopicEvent, ExploreTopicState> {
  DataRepository dataRepository = DataRepository();
  ExploreTopicBloc() : super(ExploreTopicState());

  @override
  Stream<ExploreTopicState> mapEventToState(ExploreTopicEvent event) async* {
    ResponseCategory responseCategory = await dataRepository.fetchCategory();
    if (responseCategory.success) {
      yield state.copyWith(
        status: ExploreTopicStatus.success,
        data: responseCategory.data.topics,
        message: "success",
      );
    }
  }
}

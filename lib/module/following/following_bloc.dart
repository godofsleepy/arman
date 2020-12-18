import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/model/category.dart';
import 'package:arman/data/data_repository.dart';

enum FollowingStatus { initial, success, failure }

class FollowingState extends Equatable {
  FollowingStatus status;
  List<SourceWeb> dataWeb;
  List<Topic> dataTopic;
  List<String> topicsStr;

  FollowingState({
    this.status,
    this.dataWeb,
    this.dataTopic,
    this.topicsStr,
  });

  FollowingState copyWith({
    FollowingStatus status,
    List<SourceWeb> dataWeb,
    List<Topic> dataTopic,
    List<String> topicsStr,
  }) {
    return FollowingState(
      status: status ?? this.status,
      dataWeb: dataWeb ?? this.dataWeb,
      dataTopic: dataTopic ?? this.dataTopic,
      topicsStr: topicsStr ?? this.topicsStr,
    );
  }

  @override
  List<Object> get props => [status, dataWeb, dataTopic, topicsStr];
}

class FollowingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FollowingFetch extends FollowingEvent {}

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final DataRepository apiRepository = DataRepository();
  FollowingBloc() : super(FollowingState());

  @override
  Stream<FollowingState> mapEventToState(FollowingEvent event) async* {
    try {
      List<String> topicsStr = [];
      final ResponseCategory responseCategory =
          await apiRepository.fetchCategory();
      if (responseCategory.success) {
        responseCategory.data.topics.forEach((element) {
          topicsStr.add(element.name);
        });

        yield state.copyWith(
          status: FollowingStatus.success,
          dataTopic: responseCategory.data.topics,
          dataWeb: responseCategory.data.sources,
          topicsStr: topicsStr,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

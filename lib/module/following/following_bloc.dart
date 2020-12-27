import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/response_category.dart';

enum FollowingStatus { initial, success, failure }

class FollowingState extends Equatable {
  FollowingStatus status;
  List<SourceWeb> dataWeb;
  List<Topic> dataTopic;
  List<String> topicsStr;
  List<String> tags;

  FollowingState({
    this.status = FollowingStatus.initial,
    this.dataWeb = const [],
    this.dataTopic = const [],
    this.topicsStr = const [],
    this.tags = const [],
  });

  FollowingState copyWith({
    FollowingStatus status,
    List<SourceWeb> dataWeb,
    List<Topic> dataTopic,
    List<String> topicsStr,
    List<String> tags,
  }) {
    return FollowingState(
      status: status ?? this.status,
      dataWeb: dataWeb ?? this.dataWeb,
      dataTopic: dataTopic ?? this.dataTopic,
      topicsStr: topicsStr ?? this.topicsStr,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      dataWeb,
      dataTopic,
      topicsStr,
      tags,
    ];
  }

  @override
  bool get stringify => true;
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
      List<String> tags = [];
      final ResponseCategory responseCategory =
          await apiRepository.fetchCategory();
      if (responseCategory.success) {
        responseCategory.data.topics.forEach((value) {
          if (value.has_interest == 1) {
            tags.add(value.id.toString());
          }
          topicsStr.add(value.name);
        });

        yield state.copyWith(
          status: FollowingStatus.success,
          dataTopic: responseCategory.data.topics,
          dataWeb: responseCategory.data.sources,
          topicsStr: topicsStr,
          tags: tags,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

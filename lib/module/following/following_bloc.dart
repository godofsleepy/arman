import 'package:arman/model/response_post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/response_category.dart';

enum FollowingStatus { initial, success, failure, loading }

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

class FollowingEventFollow extends FollowingEvent {
  final String type;
  final String id;
  FollowingEventFollow({
    this.type,
    this.id,
  });
}

class FollowingEventUnfollow extends FollowingEvent {
  final String type;
  final String id;
  FollowingEventUnfollow({
    this.type,
    this.id,
  });
}

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final DataRepository apiRepository = DataRepository();
  FollowingBloc() : super(FollowingState());

  @override
  Stream<FollowingState> mapEventToState(FollowingEvent event) async* {
    if (event is FollowingEventFollow) {
      final ResponsePost responsePost =
          await apiRepository.fetchFollow(event.type, event.id);
      print(responsePost.success);
    } else if (event is FollowingEventUnfollow) {
      final ResponsePost responsePost =
          await apiRepository.fetchUnfollow(event.type, event.id);
      if (responsePost.success) {
        yield await mapFollowingFetchtoState();
      }
    } else {
      yield await mapFollowingFetchtoState();
    }
  }

  Future<FollowingState> mapFollowingFetchtoState() async {
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

        return state.copyWith(
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

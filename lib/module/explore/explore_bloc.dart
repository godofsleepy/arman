import 'package:arman/data/data_repository.dart';
import 'package:arman/model/respondata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/model/item_recommendation.dart';

enum ExploreStatus { initial, success, failed }

class ExploreState extends Equatable {
  List<ItemRecommendation> data;
  String message;
  ExploreStatus status;

  ExploreState({
    this.data = const [],
    this.message = "",
    this.status = ExploreStatus.initial,
  });

  @override
  List<Object> get props => [data, message, status];

  @override
  bool get stringify => true;

  ExploreState copyWith({
    List<ItemRecommendation> data,
    String message,
    ExploreStatus status,
  }) {
    return ExploreState(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

class ExploreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class KeyWordExploreEvent extends ExploreEvent {
  final String keyword;

  KeyWordExploreEvent({this.keyword});
}

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  DataRepository dataRepository = DataRepository();
  ExploreBloc() : super(ExploreState());

  @override
  Stream<ExploreState> mapEventToState(ExploreEvent event) async* {
    if (event is KeyWordExploreEvent) {
      ResponseData responseData =
          await dataRepository.fetchSearch(event.keyword);

      yield state.copyWith(
        status: ExploreStatus.success,
        data: responseData.data,
        message: "Data retrieve success",
      );
    }
  }
}

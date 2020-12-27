import 'package:arman/data/data_repository.dart';
import 'package:arman/model/response_data.dart';
import 'package:equatable/equatable.dart';

import 'package:arman/model/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LikedStatus { initial, success, failure }

class LikedState extends Equatable {
  LikedStatus status;
  List<News> data;
  String message;

  LikedState({
    this.status = LikedStatus.initial,
    this.data = const [],
    this.message = "",
  });

  @override
  List<Object> get props => [status, data, message];

  @override
  bool get stringify => true;

  LikedState copyWith({
    LikedStatus status,
    List<News> data,
    String message,
  }) {
    return LikedState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

class LikedEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LikedBloc extends Bloc<LikedEvent, LikedState> {
  DataRepository dataRepository = DataRepository();
  LikedBloc() : super(LikedState());

  @override
  Stream<LikedState> mapEventToState(LikedEvent event) async* {
    ResponseData responseData = await dataRepository.fetchLikes();
    if (responseData.success) {
      yield state.copyWith(
        data: responseData.data,
        status: LikedStatus.success,
        message: "",
      );
    }
  }
}

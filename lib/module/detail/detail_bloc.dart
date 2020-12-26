import 'package:arman/model/responpost.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/detail.dart';

enum DetailStatus { initial, success, failure, like, unlike }

class DetailState extends Equatable {
  String message;
  DetailStatus status;
  ItemDetail data;

  DetailState({
    this.message = "",
    this.status = DetailStatus.initial,
    this.data,
  });

  @override
  List<Object> get props => [message, status, data];

  @override
  bool get stringify => true;

  DetailState copyWith({
    String message,
    DetailStatus status,
    ItemDetail data,
  }) {
    return DetailState(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}

class DetailEvent extends Equatable {
  final String id;

  DetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

class DetailLikeEvent extends DetailEvent {
  DetailLikeEvent(String id) : super(id);
}

class DetailUnlikeEvent extends DetailLikeEvent {
  DetailUnlikeEvent(String id) : super(id);
}

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DataRepository apiRepository = DataRepository();

  DetailBloc() : super(DetailState());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is DetailLikeEvent) {
      ResponsePost responsePost = await apiRepository.fetchLike(event.id);
      if (responsePost.success != null && responsePost.success == false) {
        yield state.copyWith(
          message: "Error",
        );
      }
    } else if (event is DetailUnlikeEvent) {
      print("run");
      ResponsePost responsePost = await apiRepository.fetchUnlike(event.id);
      print(responsePost.message);
      if (responsePost.success != null && responsePost.success == false) {
        yield state.copyWith(
          message: "Error",
        );
      }
    } else {
      ResponseDetail responseDetail = await apiRepository.fetchDetail(event.id);
      if (responseDetail.success) {
        yield state.copyWith(
          data: responseDetail.data,
          message: "success",
          status: DetailStatus.success,
        );
      }
    }
  }
}

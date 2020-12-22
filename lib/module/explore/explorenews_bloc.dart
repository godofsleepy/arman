import 'package:arman/data/data_repository.dart';
import 'package:arman/model/respondata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/model/item_recommendation.dart';

enum ExploreNewsStatus { initial, success, failed }

class ExploreNewsState extends Equatable {
  List<ItemRecommendation> data;
  String message;
  ExploreNewsStatus status;

  ExploreNewsState({
    this.data = const [],
    this.message = "",
    this.status = ExploreNewsStatus.initial,
  });

  @override
  List<Object> get props => [data, message, status];

  @override
  bool get stringify => true;

  ExploreNewsState copyWith({
    List<ItemRecommendation> data,
    String message,
    ExploreNewsStatus status,
  }) {
    return ExploreNewsState(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

class ExploreNewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExploreNewsBloc extends Bloc<ExploreNewsEvent, ExploreNewsState> {
  DataRepository dataRepository = DataRepository();
  ExploreNewsBloc() : super(ExploreNewsState());

  @override
  Stream<ExploreNewsState> mapEventToState(ExploreNewsEvent event) async* {
    ResponseData responseData = await dataRepository.fetchContents();
    yield state.copyWith(
      status: ExploreNewsStatus.success,
      data: responseData.data,
      message: "data retrieve successful",
    );
  }
}

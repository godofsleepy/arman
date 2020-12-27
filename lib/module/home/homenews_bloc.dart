import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/news.dart';
import 'package:arman/model/response_data.dart';

enum HomeNewsStatus { initial, success, failure, loading }

class HomeNewsState extends Equatable {
  final HomeNewsStatus status;
  final List<News> data;
  final bool hasReachedMax;
  final int page;
  final String sourceId;

  HomeNewsState({
    this.status = HomeNewsStatus.initial,
    this.data = const <News>[],
    this.hasReachedMax = false,
    this.page = 1,
    this.sourceId = "0",
  });

  HomeNewsState copyWith({
    HomeNewsStatus status,
    List<News> data,
    bool hasReachedMax,
    int page,
    String sourceId,
  }) {
    return HomeNewsState(
      status: status ?? this.status,
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      sourceId: sourceId ?? this.sourceId,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      data,
      hasReachedMax,
      page,
      sourceId,
    ];
  }

  @override
  bool get stringify => true;
}

class HomeNewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeNewsFetch extends HomeNewsEvent {
  final String sourceId;

  HomeNewsFetch({
    this.sourceId,
  });
}

class NewsBloc extends Bloc<HomeNewsEvent, HomeNewsState> {
  final DataRepository apiRepository = DataRepository();

  NewsBloc() : super(HomeNewsState());

  @override
  Stream<HomeNewsState> mapEventToState(HomeNewsEvent event) async* {
    if (event is HomeNewsFetch) {
      if (event.sourceId != "") yield state.copyWith(status: HomeNewsStatus.loading);

      yield await mapNewsFetchToState(state, event.sourceId);
    }
  }

  Future<HomeNewsState> mapNewsFetchToState(
      HomeNewsState state, String sourceId) async {
    try {
      print(state.sourceId);
      print(sourceId);

      if (sourceId == "") {
        if (state.sourceId == "0") {
          print("go");
          if (state.hasReachedMax) return state;
          final ResponseData responseData =
              await apiRepository.fetchRecommendation(state.page + 1);
          return state.copyWith(
            status: HomeNewsStatus.success,
            data: List.of(state.data)..addAll(responseData.data),
            page: state.page + 1,
            sourceId: "0",
            hasReachedMax: _hasReachedMax(responseData.data.length),
          );
        } else {
          if (state.hasReachedMax) return state;
          final ResponseData responseData =
              await apiRepository.fetchNewsbySource(sourceId, state.page + 1);

          return state.copyWith(
            status: HomeNewsStatus.success,
            data: List.of(state.data)..addAll(responseData.data),
            page: state.page + 1,
            sourceId: state.sourceId,
            hasReachedMax: _hasReachedMax(responseData.data.length),
          );
        }
      } else if (state.sourceId != sourceId) {
        print("beda");
        final ResponseData responseData =
            await apiRepository.fetchNewsbySource(sourceId, state.page);
        return state.copyWith(
          status: HomeNewsStatus.success,
          data: responseData.data,
          page: state.page,
          sourceId: state.sourceId,
          hasReachedMax: _hasReachedMax(responseData.data.length),
        );
      } else if (sourceId == "0") {
        final ResponseData responseData =
            await apiRepository.fetchRecommendation(state.page);
        return state.copyWith(
          status: HomeNewsStatus.success,
          data: responseData.data,
          page: state.page,
          sourceId: "0",
          hasReachedMax: _hasReachedMax(responseData.data.length),
        );
      }

      // if (sourceId == "0") {
      //   print("yes");
      //   if (state.hasReachedMax) return state;
      //   if (state.page == 1) {
      //   } else {}
      // } else {
      //   if (state.sourceId != sourceId) {

      //   } else {
      //     print("infinity");

      //   }
      // }
    } on Exception {
      print("exception");
      return state.copyWith(
        status: HomeNewsStatus.failure,
      );
    }
  }

  bool _hasReachedMax(int newsCount) => newsCount < 10 ? true : false;
}

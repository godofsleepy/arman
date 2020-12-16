import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/model/item_recommendation.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/service/api_repository.dart';

enum HomeNewsStatus { initial, success, failure }

class HomeNewsState extends Equatable {

  final HomeNewsStatus status;
  final List<ItemRecommendation> data;
  final bool hasReachedMax;

  HomeNewsState({
    this.status = HomeNewsStatus.initial,
    this.data = const <ItemRecommendation>[],
    this.hasReachedMax = false,
  });

  HomeNewsState copyWith({
    HomeNewsStatus status,
    List<ItemRecommendation> data,
    bool hasReachedMax,
  }) {
    return HomeNewsState(
      status: status ?? this.status,
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, data, hasReachedMax];
}

class HomeNewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeNewsFetch extends HomeNewsEvent {
  final int page;

  HomeNewsFetch({
    this.page,
  });
}

class NewsBloc extends Bloc<HomeNewsEvent, HomeNewsState> {
  final ApiRepository apiRepository = ApiRepository();
  List<ItemRecommendation> listData;

  NewsBloc() : super(HomeNewsState());

  @override
  Stream<HomeNewsState> mapEventToState(HomeNewsEvent event) async* {
    print("start");
    if (event is HomeNewsFetch) {
      yield await mapNewsFetchToState(state, event.page);
    }
  }

  Future<HomeNewsState> mapNewsFetchToState(HomeNewsState state, int page) async {
    if (state.hasReachedMax) return state;
      try {
        if (state.status == HomeNewsStatus.initial) {
          print("initial");
          final ResponseData responseData =
              await apiRepository.fetchRecommendation(page);
          // print("has reached max : ${responseData.data.length}");
          return state.copyWith(
            status: HomeNewsStatus.success,
            data: responseData.data,
            hasReachedMax: _hasReachedMax(responseData.data.length),
          );
        } else {
          print("else");
          final ResponseData responseData =
              await apiRepository.fetchRecommendation(page);
          // print("has reached max : ${responseData.data.length}");
          return state.copyWith(
            status: HomeNewsStatus.success,
            data: List.of(state.data)..addAll(responseData.data),
            hasReachedMax: _hasReachedMax(responseData.data.length),
          );
        }
      } on Exception {
        print("exception");
        return state.copyWith(
          status: HomeNewsStatus.failure,
        );
      }
  }

  bool _hasReachedMax(int postsCount) => postsCount < 10 ? true : false;
}

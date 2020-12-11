import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/model/item.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/service/api_repository.dart';
import 'package:arman/view/home/component/item_news.dart';

enum NewsStatus { initial, success, failure }

class NewsState extends Equatable {
  @override
  List<Object> get props =>  [status, data, hasReachedMax];

  final NewsStatus status;
  final List<Item> data;
  final bool hasReachedMax;

  NewsState({
    this.status = NewsStatus.initial,
    this.data = const <Item>[],
    this.hasReachedMax = false,
  });

  NewsState copyWith({
    NewsStatus status,
    List<Item> data,
    bool hasReachedMax,
  }) {
    return NewsState(
      status: status ?? this.status,
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsFetch extends NewsEvent {
  final int page;

  NewsFetch({
    this.page = 1,
  });
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository apiRepository = ApiRepository();
  List<ItemNews> listData;

  NewsBloc() : super(NewsState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    print("start");
    if (event is NewsFetch) {
      try {
        if (state.status == NewsStatus.initial) {
          print("initial");
          ResponseData responseData =
              await apiRepository.fetchRecommendation(event.page);
          print("has reached max : ${responseData.data.length}");
          yield state.copyWith(
            status: NewsStatus.success,
            data: List.of(state.data)..addAll(responseData.data),
            hasReachedMax: _hasReachedMax(responseData.data.length),
          );
        } else {
          print("else");
          ResponseData responseData =
              await apiRepository.fetchRecommendation(event.page);
          print("has reached max : ${responseData.data.length}");
          yield state.copyWith(
            status: NewsStatus.success,
            data: List.of(state.data)..addAll(responseData.data),
            hasReachedMax: _hasReachedMax(responseData.data.length),
          );
        }
      } on Exception {
        print("exception");
        yield state.copyWith(
          status: NewsStatus.failure,
        );
      }
    }
  }

  bool _hasReachedMax(int postsCount) => postsCount < 24 ? true : false;
}

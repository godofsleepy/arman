import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/response_category.dart';

enum HomeCategoryStatus { initial, success, failure }

class HomeCategoryState extends Equatable {
  List<SourceWeb> sourceWeb;
  String message;
  HomeCategoryStatus status;

  HomeCategoryState({
    this.sourceWeb = const [],
    this.message = "",
    this.status = HomeCategoryStatus.initial,
  });

  @override
  List<Object> get props => [sourceWeb, message, status];

  HomeCategoryState copyWith({
    List<SourceWeb> sourceWeb,
    String message,
    HomeCategoryStatus status,
  }) {
    return HomeCategoryState(
      sourceWeb: sourceWeb ?? this.sourceWeb,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;
}

class HomeCategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  final DataRepository apiRepository = DataRepository();

  CategoryBloc() : super(HomeCategoryState());

  @override
  Stream<HomeCategoryState> mapEventToState(HomeCategoryEvent event) async* {
    ResponseCategory responseCategory = await apiRepository.fetchCategory();
    if (responseCategory.success) {
      yield state.copyWith(
        sourceWeb: responseCategory.data.sources,
        message: "data retrieve succesful",
        status: HomeCategoryStatus.success,
      );
    }
  }
}

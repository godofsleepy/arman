import 'package:arman/model/respondata.dart';
import 'package:arman/service/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class  HomeState{}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}

class HomeLoaded extends HomeState {
  final ResponseData recommendation;

  HomeLoaded(this.recommendation);
}

class HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiRepository apiRepository =
      ApiRepository();

  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield HomeLoading();
    print("Loading");
    ResponseData recommendation = await apiRepository.fetchRecommendation();

    // if (recommendation.success == true) {
    //   yield HomeFailure(recommendation.success.toString());
    //   print("error");
    //   return;
    // }
    
    yield HomeLoaded(recommendation);
  }
}

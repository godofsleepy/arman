import 'package:arman/model/respondata.dart';
import 'package:arman/service/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class  NewsState{}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsFailure extends NewsState {
  final String errorMessage;

  NewsFailure(this.errorMessage);
}

class NewsLoaded extends NewsState {
  final ResponseData data;

  NewsLoaded(this.data);
}

class NewsEvent {}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository apiRepository =
      ApiRepository();

  NewsBloc(NewsState initialState) : super(initialState);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    yield NewsLoading();
    print("Loading");
    ResponseData data = await apiRepository.fetchRecommendation();

    if (data.success == false) {
      yield NewsFailure(data.success.toString());
      print("error");
      return;
    }
    
    yield NewsLoaded(data);
  }
}

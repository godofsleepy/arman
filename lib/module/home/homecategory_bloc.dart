import 'package:arman/model/category.dart';
import 'package:arman/service/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeCategoryState {}

class HomeCategoryInitial extends HomeCategoryState {}

class HomeCategoryLoading extends HomeCategoryState {}

class HomeCategoryFailure extends HomeCategoryState {
  final String errorMessage;

  HomeCategoryFailure(this.errorMessage);
}

class HomeCategoryLoaded extends HomeCategoryState {
  final ResponseCategory data;

  HomeCategoryLoaded(this.data);
}

class CategoryEvent {}

class CategoryBloc extends Bloc<CategoryEvent, HomeCategoryState> {
  final ApiRepository apiRepository = ApiRepository();
  CategoryBloc(HomeCategoryState initialState) : super(initialState);

  @override
  Stream<HomeCategoryState> mapEventToState(CategoryEvent event) async* {
    yield HomeCategoryLoading();
    
    ResponseCategory data = await apiRepository.fetchCategory();

    if (data.success == false) {
      yield HomeCategoryFailure(data.success.toString());
      
      return;
    }

    yield HomeCategoryLoaded(data);
  }
}

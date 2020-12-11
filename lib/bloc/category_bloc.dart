import 'package:arman/model/category.dart';
import 'package:arman/service/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String errorMessage;

  CategoryFailure(this.errorMessage);
}

class CategoryLoaded extends CategoryState {
  final ResponseCategory data;

  CategoryLoaded(this.data);
}

class CategoryEvent {}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiRepository apiRepository = ApiRepository();
  CategoryBloc(CategoryState initialState) : super(initialState);

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    yield CategoryLoading();
    
    ResponseCategory data = await apiRepository.fetchCategory();

    if (data.success == false) {
      yield CategoryFailure(data.success.toString());
      
      return;
    }

    yield CategoryLoaded(data);
  }
}

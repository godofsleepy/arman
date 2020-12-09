import 'package:arman/model/detail.dart';
import 'package:arman/service/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailFailure extends DetailState {
  final String error;

  DetailFailure(this.error);
}

class DetailLoaded extends DetailState {
  final ItemDetail data;

  DetailLoaded(this.data);
}

class DetailEvent {}

class DetailEventInitial extends DetailEvent {
  final String id;

  DetailEventInitial(this.id);
}

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(
    initialState,
  ) : super(initialState);
  ApiRepository apiRepository = ApiRepository();

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if(event is DetailEventInitial){
      yield DetailLoading();
    print("Loading");

    ResponseDetail data = await apiRepository.fetchDetail(event.id);
    if (data.success == false) {
      yield DetailFailure(data.success.toString());
      print("error");
      return;
    }

    yield DetailLoaded(data.data);
    }
  }
}

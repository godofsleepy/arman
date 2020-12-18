import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/user_account.dart';

enum ProfileStatus { inital, success, failure }

class ProfileState extends Equatable {
  UserAccount userAccount;
  String message;
  ProfileStatus status;

  ProfileState({
    this.userAccount,
    this.message = "",
    this.status = ProfileStatus.inital,
  });

  @override
  List<Object> get props => [userAccount, message, status];

  ProfileState copyWith({
    UserAccount userAccount,
    String message,
    ProfileStatus status,
  }) {
    return ProfileState(
      userAccount: userAccount ?? this.userAccount,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogoutProfile extends ProfileEvent {}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  DataRepository dataRepository;
  ProfileBloc() : super(ProfileState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    dataRepository =
        DataRepository(prefs: await SharedPreferences.getInstance());
    if (event == LogoutProfile) {
    } else {
      print("run profile");
      UserAccount userAccount = await dataRepository.getLoginInfo();
      yield state.copyWith(
        userAccount: userAccount,
        message: "Success",
        status: ProfileStatus.success,
      );
    }
  }
}

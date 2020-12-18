import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arman/data/data_repository.dart';
import 'package:arman/model/user_account.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

enum ProfileStatus { inital, success, failure, successLogout }

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

class LogoutProfileEvent extends ProfileEvent {}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  DataRepository dataRepository = DataRepository();
  ProfileBloc() : super(ProfileState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event == LogoutProfileEvent()) {
      bool logout = await dataRepository.setLogout();
      if (logout) {
        await FacebookAuth.instance.logOut();
        yield state.copyWith(
          userAccount: UserAccount(),
          message: "Success",
          status: ProfileStatus.successLogout,
        );
      }
    } else {
      UserAccount userAccount = await dataRepository.getLoginInfo();
      yield state.copyWith(
        userAccount: userAccount,
        message: "Success",
        status: ProfileStatus.success,
      );
    }
  }
}

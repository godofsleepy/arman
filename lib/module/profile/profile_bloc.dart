import 'package:arman/model/response_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:arman/data/data_repository.dart';
import 'package:arman/model/news.dart';
import 'package:arman/model/response_post.dart';
import 'package:arman/model/user_account.dart';
import 'package:arman/utils/utils.dart';

enum ProfileStatus { inital, success, failure, successLogout }

class ProfileState extends Equatable {
  UserAccount userAccount;
  String message;
  ProfileStatus status;
  List<News> data;

  ProfileState({
    this.userAccount,
    this.message = "",
    this.status = ProfileStatus.inital,
    this.data = const [],
  });

  @override
  List<Object> get props => [userAccount, message, status, data];

  ProfileState copyWith({
    UserAccount userAccount,
    String message,
    ProfileStatus status,
    List<News> data,
  }) {
    return ProfileState(
      userAccount: userAccount ?? this.userAccount,
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;
}

class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogoutProfileEvent extends ProfileEvent {}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  DataRepository dataRepository = DataRepository();
  SessionManager sessionManager = SessionManager();
  ProfileBloc() : super(ProfileState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event == LogoutProfileEvent()) {
      ResponsePost logout = await dataRepository.fetchLogout();
      if (logout.success) {
        await FacebookAuth.instance.logOut();
        await sessionManager.setLogout();
        yield state.copyWith(
          message: "Success",
          status: ProfileStatus.successLogout,
        );
      }
    } else {
      UserAccount userAccount = await sessionManager.getLoginInfo();
      final ResponseData responseData = await dataRepository.fetchBookmarks();
      yield state.copyWith(
        userAccount: userAccount,
        message: "Success",
        status: ProfileStatus.success,
        data: responseData.data
      );
    }
  }
}

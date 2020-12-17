import 'package:arman/model/responlogin.dart';
import 'package:arman/model/user_account.dart';
import 'package:arman/service/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { initial, success, loading, failure }

class LoginState extends Equatable {
  LoginStatus status;
  String message;

  LoginState({
    this.status = LoginStatus.initial,
    this.message = "",
  });

  @override
  // TODO: implement props
  List<Object> get props => [status, message];

  LoginState copyWith({
    LoginStatus status,
    String message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleLoginEvent extends LoginEvent {}

class FacebookLoginEvent extends LoginEvent {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository apiRepository = ApiRepository();

  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event == GoogleLoginEvent) {
    } else if (event == FacebookLoginEvent()) {
      try {
        yield state.copyWith(
          message: "Loading",
          status: LoginStatus.loading,
        );

        AccessToken accessToken = await FacebookAuth.instance.login();
        final userData = await FacebookAuth.instance.getUserData();

        final FacebookAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.toString());

         FirebaseAuth.instance.signInWithCredential(credential);

        final ResponseLogin responseLogin = await apiRepository.fetchLogin(
            userData.entries.elementAt(1).value.toString(),
            accessToken.token,
            "facebook");

        UserAccount userAccount = UserAccount(
          name: userData.entries.elementAt(0).value.toString(),
          accessToken: accessToken.token,
          email: userData.entries.elementAt(1).value.toString(),
          image: userData.entries.elementAt(2).value['data']['url'].toString(),
          tokenResult: responseLogin.access_token,
          refreshToken: responseLogin.refresh_token,
          expire: responseLogin.expires_in,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user", userAccount.toJson());

        yield state.copyWith(
          message: "Success",
          status: LoginStatus.success,
        );
      } catch (e, s) {
        if (e is FacebookAuthException) {
          print(e.message);
          switch (e.errorCode) {
            case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
              print("You have a previous login operation in progress");
              yield state.copyWith(
                message: "You have a previous login operation in progress",
                status: LoginStatus.failure,
              );
              break;
            case FacebookAuthErrorCode.CANCELLED:
              print("login cancelled");
              yield state.copyWith(
                message: "login cancelled",
                status: LoginStatus.failure,
              );
              break;
            case FacebookAuthErrorCode.FAILED:
              print("login failed");
              yield state.copyWith(
                message: "login failed",
                status: LoginStatus.failure,
              );
              break;
          }
        }
      }
    }
  }
}

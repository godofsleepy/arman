import 'package:arman/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

enum LoginStatus { initial, success, failure }

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
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event == GoogleLoginEvent) {
    } else if (event == FacebookLoginEvent) {
      try {
        AccessToken accessToken = await FacebookAuth.instance.login();

        final userData = await FacebookAuth.instance.getUserData();
        User user = User(
          name: userData.entries.elementAt(0).value.toString(),
          accessToken: accessToken.token,
          email: userData.entries.elementAt(1).value.toString(),
          image: userData.entries.elementAt(2).value['data']['url'].toString(),
        );
        yield state.copyWith(
          message: "Login Success",
          status: LoginStatus.success,
        );
      } catch (e, s) {
        if (e is FacebookAuthException) {
          print(e.message);
          switch (e.errorCode) {
            case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
              print("You have a previous login operation in progress");
              break;
            case FacebookAuthErrorCode.CANCELLED:
              print("login cancelled");
              break;
            case FacebookAuthErrorCode.FAILED:
              print("login failed");
              break;
          }
        }
      }
    }
  }
}

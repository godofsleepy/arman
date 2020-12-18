import 'package:arman/data/data_repository.dart';
import 'package:arman/module/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arman/module/module.dart';
import 'package:arman/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc loginBloc = LoginBloc();
  bool isLoading = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    loginBloc..add(LoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: Colors.transparent,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 4, right: 20, left: 20, bottom: 4),
              child: Text(
                "Arman",
                style: TextStyle(color: ResColor.greenColor, fontSize: 24),
              )),
        ),
        body: BlocProvider<LoginBloc>(
          create: (context) => loginBloc,
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.status == LoginStatus.success) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(),
                    ));
              } else if (state.status == LoginStatus.loading) {
                setState(() {
                  isLoading = true;
                });
              } else if (state.status == LoginStatus.failure) {
                setState(() {
                  isLoading = false;
                });
                Scaffold.of(context)
                  ..showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/login.png",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          "Ahlan wasahlan",
                          style: TextStyle(
                              color: ResColor.greenColor, fontSize: 38),
                        ),
                        Text(
                          "login terlebih dahulu untuk melanjutkan.",
                          style: TextStyle(
                            color: ResColor.blueColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SignInButton(
                          Buttons.Google,
                          onPressed: () {
                            signInWithGoogle().then((value) async {
                              value.user.getIdToken().then((value) => print(
                                  "access token user : ${value.toString()}"));

                              value.user.getIdTokenResult().then((value) =>
                                  print("access tokenresult user : $value"));
                              print("value ${value.toString()}");
                              await GoogleSignIn().signOut();
                            }).catchError((error) => print(error));
                          },
                        ),
                        SignInButton(
                          Buttons.Facebook,
                          onPressed: () {
                            loginBloc.add(FacebookLoginEvent());
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // final userData = await FacebookAuth.instance.getUserData();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // // print("Access Token : ${googleAuth.accessToken}");
    // print("Id Token : ${googleAuth.idToken}");

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    // // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

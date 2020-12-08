import 'package:arman/utils/resource.dart';
import 'package:arman/view/component/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
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
                    style: TextStyle(color: ResColor.greenColor, fontSize: 38),
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
                      // _handleSignIn().then((value) {
                      //   print(value);
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => BottomBar()));
                      // });

                      signInWithGoogle().then((value) {
                        value.user
                            .getIdTokenResult(true)
                            .then((value) => print("value : $value"));

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBar()));
                      }).catchError((error) => print(error));
                    },
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      signInWithFacebook().then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomBar(),
                            ));
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    print("Access Token : ${googleAuth.accessToken}");
    print("Id Token : ${googleAuth.idToken}");

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<GoogleSignInAccount> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //     return _googleSignIn.currentUser;
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> signInWithFacebook() async {
    try {
      AccessToken accessToken = await FacebookAuth.instance.login();
      print(accessToken.toJson());

      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomBar()));
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

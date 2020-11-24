import 'package:arman/helper/resource.dart';
import 'package:arman/view/login/login_view.dart';
import 'package:flutter/material.dart';

class MoreSheet extends StatelessWidget {
  const MoreSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlatButton.icon(
            textColor: ResColor.blueColor,
            icon: Icon(Icons.info_outline),
            onPressed: () {},
            label: Text("About"),
          ),
          FlatButton.icon(
            textColor: ResColor.blueColor,
            icon: Icon(Icons.login),
            onPressed: () {
              // Future<void> _handleSignOut() => _googleSignIn.disconnect();
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ));
            },
            label: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}

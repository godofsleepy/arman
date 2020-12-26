import 'package:arman/module/profile/profile_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'package:arman/module/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreSheet extends StatefulWidget {
  MoreSheet({Key key}) : super(key: key);

  @override
  _MoreSheetState createState() => _MoreSheetState();
}

class _MoreSheetState extends State<MoreSheet> {
  ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    profileBloc..add(ProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.successLogout) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginView(),
                ));
          }
        },
        child: Container(
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
                textColor: ResColor.blackColor,
                icon: Icon(Icons.info_outline),
                onPressed: () {},
                label: Text("About"),
              ),
              FlatButton.icon(
                textColor: ResColor.blackColor,
                icon: Icon(Icons.login),
                onPressed: () {
                  profileBloc.add(LogoutProfileEvent());
                },
                label: Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

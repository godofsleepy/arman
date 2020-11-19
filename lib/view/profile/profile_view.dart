import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          body: SizedBox.expand(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: SizedBox.expand(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: FittedBox(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1524055988636-436cfa46e59e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox.expand(
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.7,
                    minChildSize: 0.7,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          width: MediaQuery.of(context).size.width + 75,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 24, right: 18, left: 18),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              controller: scrollController,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1597653787129-6557d1ddcb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=938&q=80",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:arman/module/module.dart';
import 'package:arman/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookmark_bloc.dart';

class BookmarkView extends StatefulWidget {
  BookmarkView({Key key}) : super(key: key);

  @override
  _BookmarkViewState createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  final BookmarkBloc bookmarkBloc = BookmarkBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bookmarkBloc..add(BookmarkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bookmarkBloc,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(top: 4, right: 12, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 26,
                      color: ResColor.blackColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Bookmark",
                    style: TextStyle(
                      color: ResColor.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<BookmarkBloc, BookmarkState>(
              builder: (context, state) {
                if (state.status == BookmarkStatus.success) {
                  return ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailNewsView(
                                          id: state.data[index].id.toString(),
                                        )),
                              );
                            },
                            child: ItemSearch(
                              itemRecommendation: state.data[index],
                            ),
                          ));
                } else {
                  return CircularLoading();
                }
              },
            ),
          )),
    );
  }
}

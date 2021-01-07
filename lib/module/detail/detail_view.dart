import 'package:arman/module/detail/component/item_related.dart';
import 'package:arman/module/detail/detail_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'package:arman/module/component/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailNewsView extends StatefulWidget {
  final String id;
  DetailNewsView({Key key, this.id}) : super(key: key);

  @override
  _DetailNewsViewState createState() => _DetailNewsViewState();
}

class _DetailNewsViewState extends State<DetailNewsView> {
  final DetailBloc detailBloc = DetailBloc();
  bool bookmarked = false;
  String contentId = "none";

  @override
  void initState() {
    detailBloc.add(DetailEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailBloc,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(top: 4, right: 12, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                FlatButton.icon(
                  textColor: ResColor.blueColor,
                  onPressed: () {
                    if (contentId != "none") {
                      if (bookmarked) {
                        setState(() {
                          detailBloc.add(DetailUnBookmarkEvent(contentId));
                          bookmarked = false;
                        });
                      } else {
                        setState(() {
                          detailBloc.add(DetailBookmarkEvent(contentId));
                          bookmarked = true;
                        });
                      }
                    }
                  },
                  icon: Icon(
                    bookmarked ? Icons.bookmark : Icons.bookmark_outline,
                    size: 26,
                  ),
                  label: Text("Bookmark"),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, bottom: 16, top: 16),
              child: BlocConsumer<DetailBloc, DetailState>(
                listener: (context, state) {
                  if (state.status == DetailStatus.success) {
                    setState(() {
                      bookmarked = state.data.bookmarked;
                    });
                  }
                  if (state.message == "liked") {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Liked"),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state.status == DetailStatus.success) {
                    contentId = state.data.id.toString();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: state.data.thumbnail != null
                                ? Image.network(
                                    state.data.thumbnail,
                                    height: 270,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/no_thumbnail.jpeg",
                                    height: 270,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    state.data.source_logo,
                                    width: 24,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  state.data.source,
                                  style: TextStyle(
                                      color: ResColor.blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              state.data.content_date,
                              style: TextStyle(
                                  color: ResColor.blueColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          Utilities.parseHtmlString(state.data.title),
                          style: TextStyle(
                              color: ResColor.blackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Html(data: state.data.content),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton.icon(
                              textColor: ResColor.redColor,
                              onPressed: () {
                                if (state.data.liked) {
                                  setState(() {
                                    state.data.liked = false;
                                    detailBloc.add(DetailUnlikeEvent(
                                        state.data.id.toString()));
                                  });
                                } else {
                                  setState(() {
                                    state.data.liked = true;
                                    detailBloc.add(DetailLikeEvent(
                                        state.data.id.toString()));
                                  });
                                }
                              },
                              icon: Icon(
                                state.data.liked
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                size: 30,
                              ),
                              label: Text("like"),
                            ),
                            FlatButton.icon(
                              textColor: ResColor.blueColor,
                              onPressed: () {},
                              icon: Icon(Icons.share, size: 30),
                              label: Text("share"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 5,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Related Contents",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ResColor.blackColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => GestureDetector(
                            child: ItemRelated(
                              relatedArtic: state.data.related_articles[index],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailNewsView(
                                      id: state.data.related_articles[index].id
                                          .toString(),
                                    ),
                                  ));
                            },
                          ),
                          itemCount: state.data.related_articles.length,
                        )
                      ],
                    );
                  } else {
                    return Container(
                      child: CircularLoading(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

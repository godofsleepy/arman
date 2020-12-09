
import 'package:arman/bloc/detail_bloc.dart';
import 'package:arman/utils/resource.dart';
import 'package:arman/utils/utilities.dart';
import 'package:arman/view/component/circular_loading.dart';
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
  final DetailBloc detailBloc = DetailBloc(DetailInitial());

  @override
  void initState() {
    detailBloc.add(DetailEventInitial(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Respond to button press
                },
                icon: Icon(Icons.bookmark_outline, size: 26),
                label: Text("Bookmark"),
              )
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => detailBloc,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, bottom: 16, top: 16),
              child: DetailContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (BuildContext context, state) {
        if (state is DetailLoading) {
          return WidgetCircularLoading();
        } else if (state is DetailFailure) {
          print("error");
          return Container();
        } else if (state is DetailLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    state.data.thumbnail ?? "",
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
                      SizedBox(width: 4,),
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
                      // Respond to button press
                    },
                    icon: Icon(Icons.favorite, size: 30),
                    label: Text("2300 likes"),
                  ),
                  FlatButton.icon(
                    textColor: ResColor.blueColor,
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: Icon(Icons.share, size: 30),
                    label: Text("share"),
                  ),
                ],
              )
            ],
          );
        }
      },
    );
  }
}

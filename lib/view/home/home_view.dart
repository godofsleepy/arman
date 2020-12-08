import 'package:arman/model/respondata.dart';
import 'package:arman/utils/resource.dart';
import 'package:arman/view/detail_news/detailNews_view.dart';
import 'package:arman/view/home/component/item_category.dart';
import 'package:arman/view/home/component/item_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc homeBloc = HomeBloc(HomeInitial());

  @override
  void initState() {
    homeBloc.add(HomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Arman",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ResColor.greenColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => homeBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                color: Colors.white,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 16, top: 4),
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) => ItemCategory(
                    index: index,
                  ),
                ),
              ),
              WidgetNews(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetNews extends StatelessWidget {
  const WidgetNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: CircularProgressIndicator(),
        );
      } else if (state is HomeFailure) {
        return Container();
      } else if (state is HomeLoaded) {
        ResponseData responseData = state.recommendation;
        return Container(
          color: ResColor.greyColor,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 50, right: 20, top: 20, left: 20),
            shrinkWrap: true,
            itemCount: responseData.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailNewsView()));
                },
                child: ItemNews(
                  item: responseData.data[index],
                ),
              );
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

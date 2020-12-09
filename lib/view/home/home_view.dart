import 'package:arman/bloc/category_bloc.dart';
import 'package:arman/model/category.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/utils/resource.dart';
import 'package:arman/view/detail_news/detailNews_view.dart';
import 'package:arman/view/home/component/item_category.dart';
import 'package:arman/view/home/component/item_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/news_bloc.dart';

class HomeView extends StatefulWidget {
  
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NewsBloc newsBloc = NewsBloc(NewsInitial());
  final CategoryBloc categoryBloc = CategoryBloc(CategoryInitial());

  @override
  void initState() {
    categoryBloc.add(CategoryEvent());
    newsBloc.add(NewsEvent());
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
            create: (context) => categoryBloc,
          ),
          BlocProvider<NewsBloc>(
            create: (context) => newsBloc,
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.white,
                child: WidgetCategory(),
              ),
              WidgetNews(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetCategory extends StatelessWidget {
  const WidgetCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: CircularProgressIndicator(),
        );
      } else if (state is CategoryFailure) {
        return Container(
          child: Text("error"),
        );
      } else if (state is CategoryLoaded) {
        ResponseCategory responseCategory = state.data;
        return ListView.builder(
          padding: EdgeInsets.only(left: 16, top: 4),
          scrollDirection: Axis.horizontal,
          itemCount: responseCategory.data.sources.length,
          itemBuilder: (context, index) => ItemCategory(
            index: index,
            sourceWeb: responseCategory.data.sources[index],
          ),
        );
      }
    });
  }
}

class WidgetNews extends StatelessWidget {
  const WidgetNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: CircularProgressIndicator(),
        );
      } else if (state is NewsFailure) {
        return Container();
      } else if (state is NewsLoaded) {
        ResponseData responseData = state.data;
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
                          builder: (context) => DetailNewsView(id: responseData.data[index].id.toString(),)));
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

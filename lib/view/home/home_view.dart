import 'package:arman/bloc/category_bloc.dart';
import 'package:arman/model/category.dart';
import 'package:arman/model/item.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/utils/resource.dart';
import 'package:arman/view/component/bottom_loader.dart';
import 'package:arman/view/detail_news/detailNews_view.dart';
import 'package:arman/view/home/component/item_category.dart';
import 'package:arman/view/home/component/item_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/news_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NewsBloc newsBloc = NewsBloc();
  final CategoryBloc categoryBloc = CategoryBloc(CategoryInitial());
  final scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    categoryBloc.add(CategoryEvent());
    newsBloc.add(NewsFetch());
    scrollController.addListener(() {
      if (isBottom) {
        newsBloc.add(NewsFetch(page: page++));
      }
    });
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
          controller: scrollController,
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

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class WidgetCategory extends StatelessWidget {
  const WidgetCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return Shimmer.fromColors(
          child: ListView.builder(
              padding: EdgeInsets.only(left: 16, top: 4),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Material(
                            color: ResColor.greenColor, // button color
                            child: SizedBox(
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  )),
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          enabled: true,
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
      print(state.status);
      if (state.status == NewsStatus.failure) {
        print("failure");
        return Container();
      } else if (state.status == NewsStatus.success) {
        List<Item> responseData = state.data;
        print("Data");
        return Container(
          color: ResColor.greyColor,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 50, right: 20, top: 20, left: 20),
            shrinkWrap: true,
            itemCount: responseData.length + 1,
            itemBuilder: (context, index) {
              return index >= responseData.length
                  ? BottomLoader()
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailNewsView(
                                      id: responseData[index].id.toString(),
                                    )));
                      },
                      child: ItemNews(
                        item: responseData[index],
                      ),
                    );
            },
          ),
        );
      } else {
        print("Loading");
        return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

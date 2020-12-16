import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/widgetNews.dart';
import 'homenews_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'homecategory_bloc.dart';
import 'component/widgetCategory.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NewsBloc newsBloc = NewsBloc();
  final CategoryBloc categoryBloc = CategoryBloc(HomeCategoryInitial());
  final scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    categoryBloc.add(CategoryEvent());
    newsBloc..add(HomeNewsFetch(page: page));
    scrollController.addListener(onScroll);
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

  void onScroll() {
    if (isBottom) newsBloc.add(HomeNewsFetch(page: page+=1));
  }

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

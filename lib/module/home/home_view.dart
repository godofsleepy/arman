import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'component/item_category.dart';
import 'component/widgetnews.dart';
import 'homenews_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'homecategory_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NewsBloc newsBloc = NewsBloc();
  final CategoryBloc categoryBloc = CategoryBloc();
  final scrollController = ScrollController();
  int page = 1;
  int selected = 0;

  @override
  void initState() {
    categoryBloc..add(HomeCategoryEvent());
    newsBloc..add(HomeNewsFetch(sourceId: "0"));
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
                child: BlocBuilder<CategoryBloc, HomeCategoryState>(
                    builder: (context, state) {
                  if (state.status == HomeCategoryStatus.success) {
                    return ListView.builder(
                      addAutomaticKeepAlives: true,
                      padding: EdgeInsets.only(left: 16, top: 4),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.sourceWeb.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });

                          if (index != 0) {
                            newsBloc.add(HomeNewsFetch(
                                sourceId:
                                    state.sourceWeb[index].id.toString()));
                          } else {
                            newsBloc.add(HomeNewsFetch(sourceId: "0"));
                          }
                        },
                        child: ItemCategory(
                          selected: selected == index ? true : false,
                          index: index,
                          sourceWeb: state.sourceWeb[index],
                        ),
                      ),
                    );
                  } else if (state.status == HomeCategoryStatus.failure) {
                    return Container(
                      child: Text("error"),
                    );
                  } else {
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
                                        color:
                                            ResColor.greenColor, // button color
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
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
                  }
                }),
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
    if (isBottom) newsBloc.add(HomeNewsFetch(sourceId: ""));
  }

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

import 'package:arman/module/search/search_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'package:arman/module/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/recent_search.dart';
import 'component/item_search.dart';

class SearchView extends StatefulWidget {
  SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchBloc searchBloc = SearchBloc();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    searchBloc..add(SearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc,
      child: Scaffold(
        backgroundColor: ResColor.greyColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: ResColor.whiteColor,
            title: Container(
              child: TextField(
                onSubmitted: (value) {
                  searchBloc.add(KeyWordSearchEvent(keyword: value));
                },
                autofocus: true,
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                      });
                    },
                    icon: Icon(Icons.clear),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ResColor.blackColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ResColor.blackColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ResColor.blackColor),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: ResColor.whiteColor,
          child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state.status == SearchStatus.initial) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Searches",
                              style: TextStyle(
                                fontSize: 18,
                                color: ResColor.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 500,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, right: 20),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchController.text = "warisan";
                                    });
                                  },
                                  child: RecentSearch(),
                                ),
                              ),
                            )
                          ],
                        );
                      } else if (state.status == SearchStatus.success) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GestureDetector(
                            child: ItemSearch(itemRecommendation: state.data[index],),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailNewsView(id: state.data[index].id.toString(),),
                                  ));
                            },
                          ),
                          itemCount: state.data.length,
                        );
                      } else if (state.status == SearchStatus.failed) {
                      } else {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 3),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

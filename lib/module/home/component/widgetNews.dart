import 'package:arman/model/item_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arman/module/module.dart';
import 'package:arman/utils/utils.dart';
import '../homenews_bloc.dart';



class WidgetNews extends StatelessWidget {
  const WidgetNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, HomeNewsState>(builder: (context, state) {
      print(state.data);

      if (state.status == HomeNewsStatus.failure) {
        print("failure");
        return Container();
      } else if (state.status == HomeNewsStatus.success) {
        List<ItemRecommendation> responseData = state.data;
        print("Data");
        return Container(
          color: ResColor.greyColor,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 50, right: 20, top: 20, left: 20),
            shrinkWrap: true,
            itemCount: state.hasReachedMax
                ? responseData.length
                : responseData.length + 1,
            itemBuilder: (context, index) {
              print("data length : ${responseData.length}");
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
        return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

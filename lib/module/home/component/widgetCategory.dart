import 'package:arman/module/home/homecategory_bloc.dart';
import 'package:arman/model/category.dart';
import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'item_category.dart';

class WidgetCategory extends StatelessWidget {
  const WidgetCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, HomeCategoryState>(builder: (context, state) {
      if (state is HomeCategoryLoading) {
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
      } else if (state is HomeCategoryFailure) {
        return Container(
          child: Text("error"),
        );
      } else if (state is HomeCategoryLoaded) {
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
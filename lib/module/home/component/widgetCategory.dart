import 'package:arman/module/home/homecategory_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'item_category.dart';

class WidgetCategory extends StatelessWidget {
  const WidgetCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, HomeCategoryState>(
        builder: (context, state) {
      if (state.status == HomeCategoryStatus.success) {
        return ListView.builder(
          addAutomaticKeepAlives: true,
          padding: EdgeInsets.only(left: 16, top: 4),
          scrollDirection: Axis.horizontal,
          itemCount: state.sourceWeb.length,
          itemBuilder: (context, index) => ItemCategory(
            index: index,
            sourceWeb: state.sourceWeb[index],
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
                            color: ResColor.greenColor, // button color
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
    });
  }
}

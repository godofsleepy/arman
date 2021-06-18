import 'package:arman/model/response_category.dart';
import 'package:arman/utils/utils.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  final int index;
  final bool selected;
  final SourceWeb sourceWeb;
  const ItemCategory({Key key, this.index, this.sourceWeb, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                ClipOval(
                  child: Material(
                    color: ResColor.greenColor, // button color
                    child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "For You",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color:
                          selected ? ResColor.blueColor : ResColor.blackColor),
                )
              ],
            ),
          )
        : sourceWeb.has_interest == 1
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    ClipOval(
                        child: Image.network(
                      sourceWeb.logo,
                      width: 35,
                      height: 35,
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      sourceWeb.name,
                      style: TextStyle(
                        color:
                            selected ? ResColor.blueColor : ResColor.blackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
            : Container();
    ;
  }
}

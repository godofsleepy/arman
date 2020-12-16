import 'package:arman/model/category.dart';
import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  final int index;
  final SourceWeb sourceWeb;
  const ItemCategory({Key key, this.index, this.sourceWeb}) : super(key: key);

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
                    child: InkWell(
                      splashColor: ResColor.whiteColor, // inkwell color
                      child: SizedBox(
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                      onTap: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "For You",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
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
                      height: 2,
                    ),
                    Text(
                      sourceWeb.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                    )
                  ],
                ),
              )
            : Container();
    ;
  }
}
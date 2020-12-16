import 'package:arman/model/item_recommendation.dart';
import 'package:arman/utils/resource.dart';
import 'package:arman/utils/utilities.dart';
import 'package:flutter/material.dart';

class ItemNews extends StatelessWidget {
  final ItemRecommendation item;

  const ItemNews({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return item.content_type == "Article"
        ? Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              item.source_logo,
                              width: 22,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            item.source ?? "",
                            style: TextStyle(
                                color: ResColor.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: item.bookmarked == false
                            ? Icon(
                                Icons.bookmark_outline,
                                color: ResColor.blueColor,
                              )
                            : Icon(
                                Icons.bookmark,
                                color: ResColor.blueColor,
                              ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    Utilities.parseHtmlString(item.title),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: ResColor.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    Utilities.countDifference(item.content_date),
                    style: TextStyle(
                        color: ResColor.blueColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 13),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        item.thumbnail ??
                            "https://cached.imagescaler.hbpl.co.uk/resize/scaleHeight/815/cached.offlinehbpl.hbpl.co.uk/news/OMC/NikeMuslim-20180124014618716.jpg",
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
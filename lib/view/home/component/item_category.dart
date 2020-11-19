import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          ClipOval(
            child: Material(
              color: ResColor.greenColor, // button color
              child: InkWell(
                splashColor: ResColor.blueColor, // inkwell color
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
            "Trending",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          )
        ],
      ),
    );
  }
}

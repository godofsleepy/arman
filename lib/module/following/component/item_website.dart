import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';

class ItemWebsite extends StatelessWidget {
  const ItemWebsite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(6),
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              child: Image.network(
                "https://rumaysho.com/wp-content/uploads/2017/04/cropped-Master-Logo_Logo-Icon-Rumaysho-Merah_transparan.png",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("rumaysho")
        ],
      ),
    );
  }
}

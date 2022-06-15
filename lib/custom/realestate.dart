import 'package:flutter/material.dart';
import 'package:uidesign/custom/borderbox.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/custom_functions.dart';
import 'package:uidesign/utils/widget_functions.dart';

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, this.itemData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(itemData["image"]),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: BorderIcon(
                    padding: const EdgeInsets.all(8.0),
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    )),
              ),
            ],
          ),
          addVerticalSpace(15),
          Text("${formatCurrency(itemData["amount"])}",style: themeData.textTheme.headline1,),
          addVerticalSpace(10),
          Text("${itemData["address"]}",style: themeData.textTheme.bodyText2,),
          addVerticalSpace(10),
          Text("${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
          style: themeData.textTheme.headline5,)
        ],
      ),
    );
  }
}

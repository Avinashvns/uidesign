import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidesign/custom/borderbox.dart';
import 'package:uidesign/custom/choiceoption.dart';
import 'package:uidesign/custom/optionbutton.dart';
import 'package:uidesign/custom/realestate.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/sample_data.dart';
import 'package:uidesign/utils/widget_functions.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderIcon(
                            padding: const EdgeInsets.all(8.0),
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.menu,
                              color: COLOR_BLACK,
                            )),
                        BorderIcon(
                            padding: const EdgeInsets.all(8.0),
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.settings,
                              color: COLOR_BLACK,
                            )),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "Varanasi",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "India",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ["<\$2000", "For Sale", "3-4 Beds", ">1000 sqrt"]
                          .map((filter) => ChoiceOption(text: filter))
                          .toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(itemData: RE_DATA[index],);
                          }),

                    ),
                  ),

                ],
              ),
              Positioned(
                bottom: 20,
                  width: size.width,
                  child: Center(
                    child: OptionButton(
                    text: "Map View",
                    icon: Icons.map_rounded,
                      width: size.width * 0.35,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

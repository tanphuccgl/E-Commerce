import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class XBottomSheetAddReview extends StatelessWidget {
  const XBottomSheetAddReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'What is your rate',
              style: XStyle.textTheme().headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 18, 0, 35),
              child: _reviewStars(0),
            ),
            Text(
              'Please share your opinion\nabout the product',
              textAlign: TextAlign.center,
              style: XStyle.textTheme().headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 343,
              height: 154,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        color: MyColors.colorWhite.withOpacity(0.05),
                        blurRadius: 8,
                        spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(4),
                  color: MyColors.colorWhite),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                      color: MyColors.colorGray),
                  hintText: 'Your review',
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 9, 22),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 39, horizontal: 16),
                child: Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                      color: MyColors.colorWhite,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 1),
                            color: MyColors.colorWhite.withOpacity(0.16),
                            blurRadius: 16,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: MyColors.colorPrimary,
                        child: Icon(Icons.camera_alt,
                            color: MyColors.colorWhite, size: 25),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Add your photos',
                        style: TextStyle(
                            height: 1.22,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: MyColors.colorBlack),
                      )
                    ],
                  ),
                ),
              ),
            ),
            XButton(
              label: 'SEND REVIEW',
              height: 48,
              width: 343,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

Widget _reviewStars(int numberStar) {
  var numberStarNoActive = 5 - numberStar;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  width: 36,
                  height: 34,
                  child:
                      Image.asset(MyIcons.activeStarIcon2, fit: BoxFit.cover),
                ),
              );
            },
            itemCount: numberStar),
      ),
      SizedBox(
        height: 45,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    icon: Image.asset(
                      MyIcons.starIcon2,
                      fit: BoxFit.cover,
                      width: 34,
                      height: 34,
                    ),
                    iconSize: 10,
                    onPressed: () {},
                  ));
            },
            itemCount: numberStarNoActive),
      ),
    ],
  );
}

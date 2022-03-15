import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/rating/widgets/button_write_review.dart';
import 'package:e_commerce/src/modules/rating/widgets/fade_end_widget.dart';
import 'package:e_commerce/src/modules/rating/widgets/header_rating_delegate.dart';
import 'package:e_commerce/src/modules/rating/widgets/review_card.dart';
import 'package:e_commerce/src/modules/rating/widgets/statistics_widget.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.colorBackground,
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                Theme(
                  data: ThemeData(
                    appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: MyColors.colorBlack),
                    ),
                    textTheme: Theme.of(context).textTheme,
                  ),
                  child: const SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: HeaderRating(),
                  ),
                ),
                const SliverToBoxAdapter(child: StatisticsWidget()),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '8 reviews',
                        style: TextStyle(
                            color: MyColors.colorBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            activeColor: MyColors.colorBlack,
                            onChanged: (value) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          const Text(
                            'With photo',
                            style: TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const XReviewCard();
                    },
                    childCount: 5,
                  ),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 50,
                )),
              ],
            ),
            const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 90,
                child: FadeEndWidget()),
            const Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(17),
                  child: XButtonWriteReview(),
                ))
          ],
        ));
  }
}

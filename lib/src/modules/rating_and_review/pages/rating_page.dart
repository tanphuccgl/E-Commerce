import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/rating_and_review/widgets/button_write_review.dart';
import 'package:e_commerce/src/modules/rating_and_review/widgets/fade_end_widget.dart';
import 'package:e_commerce/src/modules/rating_and_review/widgets/header_rating_delegate.dart';
import 'package:e_commerce/src/modules/rating_and_review/widgets/review_card.dart';
import 'package:e_commerce/src/modules/rating_and_review/logic/review_bloc.dart';
import 'package:e_commerce/src/modules/rating_and_review/widgets/statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingPage extends StatelessWidget {
  final XProduct data;
  const RatingPage({Key? key, required this.data}) : super(key: key);

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
                SliverToBoxAdapter(child: StatisticsWidget(data: data)),
                SliverToBoxAdapter(child: BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.numberReview(data: data).toString() +
                                " reviews",
                            style: const TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                          //TODO
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
                    );
                  },
                )),
                //TODO
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return XReviewCard(
                        data: (data.listReview ?? [])[index],
                      );
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
                //TODO
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

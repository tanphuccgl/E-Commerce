import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/favorites/widgets/filter_bar.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/widgets/chip/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderFavorite extends SliverPersistentHeaderDelegate {
  const HeaderFavorite();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;
    const paddingAppbar = kToolbarHeight;
    return Material(
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: progress,
              child: const ColoredBox(
                color: MyColors.colorWhite,
              ),
            ),
            AppBar(
              backgroundColor: MyColors.colorWhite,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  color: MyColors.colorBlack,
                  onPressed: () =>
                      DashboardCoordinator.showSearchProductByFavorite(context),
                )
              ],
              elevation: 3,
            ),
            Container(
              padding: EdgeInsets.lerp(
                const EdgeInsets.fromLTRB(16, paddingAppbar, 0, 0),
                const EdgeInsets.only(top: 20, bottom: 10),
                progress,
              ),
              alignment: Alignment.lerp(
                Alignment.topLeft,
                Alignment.topCenter,
                progress,
              ),
              child: Opacity(
                opacity: shrinkOffset > 1 && shrinkOffset < 100 ? progress : 1,
                child: Text(
                  'Favorites',
                  textAlign: TextAlign.center,
                  style: TextStyle.lerp(
                    Theme.of(context).textTheme.headlineLarge,
                    Theme.of(context).textTheme.headlineSmall,
                    progress,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.lerp(
                EdgeInsets.zero,
                EdgeInsets.zero,
                progress,
              ),
              alignment: Alignment.lerp(
                Alignment.topCenter,
                Alignment.center,
                progress,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<CategoriesBloc, CategoriesState>(
                        builder: (context, state) {
                      var items = state.items.data ?? [];

                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                          itemCount: items.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return TagChip(
                              label: items[index].name ?? 'N/A',
                              idCategory: items[index].id,
                              onPressed: () {},
                            );
                          },
                        ),
                      );
                    }),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(14, 5, 14, 0),
                      child: FilerBarFavorites(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 151;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

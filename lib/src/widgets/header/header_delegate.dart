import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/widgets/chip/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Function()? onPressedSearch;
  final bool isShowTagChip;
  final bool isShowFilterBar;
  final bool unSelectTagChip;
  final Widget? filterBarWidget;
  final Color backgroundColor;
  final double elevation;

  const XHeaderDelegate(
      {required this.title,
      this.onPressedSearch,
      this.filterBarWidget,
      this.elevation = 0,
      this.backgroundColor = MyColors.colorWhite,
      this.isShowFilterBar = false,
      this.unSelectTagChip = false,
      this.isShowTagChip = false});

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
              backgroundColor: backgroundColor,
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    color: MyColors.colorBlack,
                    onPressed: onPressedSearch ?? () {})
              ],
              elevation: elevation,
            ),
            Container(
              padding: EdgeInsets.lerp(
                const EdgeInsets.fromLTRB(16, paddingAppbar, 0, 0),
                const EdgeInsets.only(top: 15, bottom: 10),
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
                  title,
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
                    isShowTagChip
                        ? BlocBuilder<CategoriesBloc, CategoriesState>(
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
                                    unSelectTagChip: unSelectTagChip,
                                  );
                                },
                              ),
                            );
                          })
                        : const SizedBox.shrink(),
                    isShowFilterBar
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(14, 5, 14, 0),
                            child: filterBarWidget)
                        : const SizedBox.shrink()
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
  double get maxExtent {
    double extent = 130;
    if (isShowTagChip && isShowFilterBar) {
      extent = 200;
    }
    if (isShowFilterBar && isShowTagChip == false) {
      extent = 160;
    }

    return extent;
  }

  @override
  double get minExtent {
    double extent = 70;
    if (isShowTagChip && isShowFilterBar) {
      extent = 151;
    }
    if (isShowFilterBar && isShowTagChip == false) {
      extent = 110;
    }

    return extent;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

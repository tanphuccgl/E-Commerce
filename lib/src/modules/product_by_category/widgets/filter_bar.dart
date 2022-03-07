import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/modules/product_by_category/logic/product_by_category_bloc.dart';
import 'package:e_commerce/src/modules/product_by_category/widgets/bottom_sheet_sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilerBar extends StatelessWidget {
  const FilerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      color: MyColors.colorBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: _filter()),
          Expanded(flex: 3, child: _sort()),
          Expanded(child: _viewType())
        ],
      ),
    );
  }

  Widget _filter() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      child: Row(
        children: [
          Image.asset(
            MyIcons.filterIcon,
            color: MyColors.colorBlack,
          ),
          const SizedBox(
            width: 11,
          ),
          const Text(
            'Filter',
            style: TextStyle(
                color: MyColors.colorBlack,
                fontSize: 11,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _sort() {
    return BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          const radius = Radius.circular(34);
          showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: radius, topRight: radius)),
              backgroundColor: MyColors.colorWhite,
              builder: (BuildContext context) {
                return const XBottomSheetSort();
              });
        },
        style: ElevatedButton.styleFrom(
            primary: MyColors.colorBackground,
            onPrimary: MyColors.colorBackground,
            shadowColor: MyColors.colorWhite,
            elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              MyIcons.sortIcon,
              color: MyColors.colorBlack,
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              state.sortBy.value(),
              style: const TextStyle(
                  color: MyColors.colorBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      );
    });
  }

  Widget _viewType() {
    return BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        builder: (context, state) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: MyColors.colorBackground,
            onPrimary: MyColors.colorBackground,
            shadowColor: MyColors.colorWhite,
            elevation: 0),
        onPressed: () => context.read<ProductByCategoryBloc>().changeViewType(),
        child: Row(
          children: [
            Image.asset(
              state.isListViewType ? MyIcons.gridIcon : MyIcons.listIcon,
              color: MyColors.colorBlack,
            ),
          ],
        ),
      );
    });
  }
}

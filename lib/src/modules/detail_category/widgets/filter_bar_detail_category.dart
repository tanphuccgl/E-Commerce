import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/modules/product/logic/product_bloc.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/modules/detail_category/widgets/bottom_sheet_sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilerBarDetailCategory extends StatelessWidget {
  const FilerBarDetailCategory({
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
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () => XBottomSheet.show(context,
            widget: const XBottomSheetSortDetailCategory()),
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
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: MyColors.colorBackground,
            onPrimary: MyColors.colorBackground,
            shadowColor: MyColors.colorWhite,
            elevation: 0),
        onPressed: () => context.read<ProductBloc>().changeViewType(),
        child: Row(
          children: [
            Image.asset(
              state.viewType.iconOf(),
              color: MyColors.colorBlack,
            ),
          ],
        ),
      );
    });
  }
}

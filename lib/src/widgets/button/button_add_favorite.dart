
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/favorites/widgets/bottom_sheet_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XButtonAddToFavorite extends StatelessWidget {
  final XProduct data;
  final bool isActive;
  const XButtonAddToFavorite(
      {Key? key, required this.isActive, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: isActive
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: MyColors.colorPrimary,
                  primary: MyColors.colorPrimary,
                  onPrimary: MyColors.colorWhite,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  shape: const CircleBorder()),
              onPressed: () {},
              child: const Image(
                image: AssetImage(MyIcons.favoriteIcon),
              ))
          : BlocBuilder<FavoriteBloc,FavoriteState>(
            builder: (context,state) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: MyColors.colorWhite,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: MyColors.colorWhite,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      onPrimary: MyColors.colorPrimary,
                      shape: const CircleBorder()),
                  onPressed: () {
                    const radius = Radius.circular(34);
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: radius, topRight: radius)),
                        backgroundColor: MyColors.colorWhite,
                        builder: (BuildContext context) {
                          return XBottomSheetFavorite(
                            data: data,
                          );
                        }).then((value) => context.read<FavoriteBloc>().initSizeType());
                  },
                  child: const Image(
                    image: AssetImage(MyIcons.favoriteIcon),
                    height: 9,
                    fit: BoxFit.fill,
                  ));
            }
          ),
    );
  }
}

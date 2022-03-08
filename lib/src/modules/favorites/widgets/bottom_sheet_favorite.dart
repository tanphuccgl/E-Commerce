import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetFavorite extends StatelessWidget {
  final XProduct data;
  const XBottomSheetFavorite({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> sizeList = ['XS', 'S', 'M', 'L', 'XL'];

    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Select size',
                style: XStyle.textTheme().headlineSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  height: 100,
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 100 / 40,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 16,
                    children: sizeList.map((e) => _boxSize(e)).toList(),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Size info',
                  style: TextStyle(
                      color: MyColors.colorBlack,
                      height: 1,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                onTap: () {},
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                    // TODO: select size, color then add firestore
                return XButton(
                    label: 'ADD TO FAVORITES',
                    height: 47,
                    width: double.infinity,
                    onPressed: state.hadFavorites(data)
                        ? null
                        : () {
                            context.read<FavoriteBloc>().addProduct(data);
                            XCoordinator.pop(context);
                          });
              })
            ],
          ),
        ),
      ),
    );
  }
}

Widget _boxSize(String size) {
  return SizedBox(
    height: 40,
    width: 100,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorWhite,
          onPrimary: MyColors.colorPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: MyColors.colorGray, width: 0.4))),
      child: Center(
        child: Text(size,
            textAlign: TextAlign.center,
            style: const TextStyle(
                height: 1.42,
                fontSize: 14,
                color: MyColors.colorBlack,
                fontWeight: FontWeight.w500)),
      ),
    ),
  );
}

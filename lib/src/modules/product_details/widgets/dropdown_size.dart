import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XDropdownSize extends StatelessWidget {
  const XDropdownSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      return Container(
        width: 138,
        height: 40,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: MyColors.colorGray,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: MyColors.colorBlack),
              iconSize: 20,
              hint: const Text(
                "Size",
                style: TextStyle(
                    color: MyColors.colorBlack,
                    height: 1.42,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              elevation: 1,
              isExpanded: true,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              style: const TextStyle(color: MyColors.colorPrimary),
              underline: const SizedBox.shrink(),
              onChanged: (String? newValue) {},
              items: SizeType.values.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value.value(),
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text(value.value()),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                      )))),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }
}

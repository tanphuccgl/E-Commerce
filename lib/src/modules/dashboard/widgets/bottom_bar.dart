import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomNavigationBar extends StatelessWidget {
  const XBottomNavigationBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            for (final item in PageIndex.values)
              BottomNavigationBarItem(
                  activeIcon: item.activeIconOf(),
                  icon: item.iconOf(),
                  label: item.lableOf()),
          ],
          currentIndex: state.index.index,
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedLabelStyle:
              const TextStyle(fontSize: 10, color: MyColors.colorGray),
          selectedItemColor: MyColors.colorPrimary,
          onTap: context.read<BottomBarBloc>().onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
        );
      },
    );
  }
}

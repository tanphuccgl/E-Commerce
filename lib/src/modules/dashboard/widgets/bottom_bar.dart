import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomNavigationBar extends StatelessWidget {
  const XBottomNavigationBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          context.read<BottomBarBloc>().getPage(DashboardRouters.home);

          break;
        case 1:
          context.read<BottomBarBloc>().getPage(DashboardRouters.shop);

          break;
        case 2:
          context.read<BottomBarBloc>().getPage(DashboardRouters.bag);

          break;
        case 3:
          context.read<BottomBarBloc>().getPage(DashboardRouters.favorites);

          break;
        case 4:
          context.read<BottomBarBloc>().getPage(DashboardRouters.profile);

          break;
      }
    }

    Size size = MediaQuery.of(context).size;
    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: size.width * 0.05),
                label: ""),
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.shopping_cart_outlined, size: size.width * 0.05),
                label: ""),
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.shopping_bag_outlined, size: size.width * 0.05),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: size.width * 0.05),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp, size: size.width * 0.05),
                label: ""),
          ],
          currentIndex: state.index,
          selectedItemColor: MyColors.colorPrimary,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      },
    );
  }
}

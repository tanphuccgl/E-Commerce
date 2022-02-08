import 'package:e_commerce/src/config/routes/navigation.dart';
import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:flutter/material.dart';

class XBottomNavigationBar extends StatelessWidget {
  final int index;

  const XBottomNavigationBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          // TODO: Cái gì đây ?? =))
          XNavigation.showDashboardPage();
          break;

        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
        case 4:
          break;
      }
    }

    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: size.width * 0.05),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner, size: size.width * 0.05),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner, size: size.width * 0.05),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner, size: size.width * 0.05),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp, size: size.width * 0.05),
            label: ""),
      ],
      currentIndex: index,
      selectedItemColor: MyColors.colorPrimary,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}

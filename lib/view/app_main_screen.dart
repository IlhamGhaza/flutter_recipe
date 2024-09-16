import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constant.dart';
import 'home_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeScreen(),
      navBarPage(Iconsax.heart5),
      navBarPage(Iconsax.calendar5),
      navBarPage(Iconsax.setting_21),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 20,
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Iconsax.home5 : Iconsax.home1),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 1 ? Iconsax.heart5 : Iconsax.heart),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                selectedIndex == 2 ? Iconsax.calendar5 : Iconsax.calendar5),
            label: 'Meal Plant',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                selectedIndex == 3 ? Iconsax.setting_2 : Iconsax.setting_2),
            label: 'Setting',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: primaryColor,
      ),
    );
  }
}

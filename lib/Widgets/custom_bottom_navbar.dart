import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';

class CustomBottomNavigationBars extends StatelessWidget {
  const CustomBottomNavigationBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) => homePageProvider.isLoading
          ? const SpinKitFadingCircle(
              color: Colors.grey,
              size: 50.0,
            )
          : const CustomBottomNavbar(
              gridIcons: Icons.menu,
              homeIcon: Icons.home,
              homeSlider: Icons.slideshow,
              homeadd: Icons.person,
              homebalence: Icons.history,
            ),
    );
  }
}

class CustomBottomNavbar extends StatelessWidget {
  final IconData? homeIcon;
  final IconData? homeadd;
  final IconData? homeSlider;
  final IconData? homebalence;
  final IconData? gridIcons;

  const CustomBottomNavbar({
    super.key,
    this.homeIcon,
    this.homeadd,
    this.homeSlider,
    this.homebalence,
    this.gridIcons,
  });

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.grey,
          icon: Icon(homeIcon),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(homeadd),
          label: 'Ads',
        ),
        BottomNavigationBarItem(
          icon: Icon(homeSlider),
          label: 'Slider',
        ),
        BottomNavigationBarItem(
          icon: Icon(homebalence),
          label: 'Bank',
        ),
        BottomNavigationBarItem(
          icon: Icon(gridIcons),
          label: 'Gallery',
        ),
      ],
      currentIndex: homePageProvider.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        homePageProvider.setSelectedIndex(index);
      },
    );
  }
}

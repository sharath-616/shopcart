import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Service/bank_adds.dart';
import 'package:shopcart/Service/homepage_adds.dart';
import 'package:shopcart/Service/homepage_circleavatar.dart';
import 'package:shopcart/Service/homepage_slider.dart';
import 'package:shopcart/Widgets/custom_bottom_navbar.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';
import 'package:shopcart/Widgets/grid_gallery.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: ShopAppBar(),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) {
          if (homePageProvider.isLoading) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Color.fromARGB(255, 0, 0, 0),
                size: 50.0,
              ),
            );
          }

          if (homePageProvider.itemImage.shirts.isEmpty) {
            return const Center(
              child: Text('No items available'),
            );
          }

          return const SingleChildScrollView(
            child: Column(
              children: [
                HomepageCircleavatar(),
                HomepageAdds(),
                HomepageSlider(),
                Divider(),
                BankAdds(),
                Divider(),
                GridGallery(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBars(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Service/bank_adds.dart';
import 'package:shopcart/Service/homepage_adds.dart';
import 'package:shopcart/Service/homepage_circleavatar.dart';
import 'package:shopcart/Service/homepage_slider.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';
import 'package:shopcart/Widgets/custom_bottom_navbar.dart';
import 'package:shopcart/Widgets/grid_gallery.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppbar(
          bellFunctions: () {},
          favoriteFunctions: () {
            context.read<HomePageProvider>().clickedfavor();
          },
          cartFunction: () {},
          bellIcons: CupertinoIcons.bell,
          favoriteIcons: context.watch<HomePageProvider>().isfavor ? Icons.favorite : Icons.favorite_border,
          cartIcons: CupertinoIcons.bag,
          controller: context.watch<HomePageProvider>().userSearchController,
        ),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) => SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: homePageProvider.isLoading
                    ? const Center(
                        child: SpinKitFadingCircle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 50.0,
                        ),
                      )
                    : homePageProvider.itemImage.shirts.isEmpty
                        ? const Center(
                            child: Text('No items available'),
                          )
                        : const SingleChildScrollView(
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
                          ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBars(),
    );
  }
}

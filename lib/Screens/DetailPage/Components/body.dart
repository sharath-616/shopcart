import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Screens/CartPage/cart_page.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: CustomAppbar(
          leading: IconButton(
            onPressed: () {
              context.go(HomePage.classId);
            },
            icon: const Icon(
              Icons.close,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: '',
          bellFunctions: () {},
          favoriteFunctions: () {
            context.read<HomePageProvider>().clickedfavor();
          },
          cartFunction: () {
            context.go(CartPage.classId);
          },
          bellIcons: CupertinoIcons.bell,
          favoriteIcons: context.watch<HomePageProvider>().isfavor ? Icons.favorite : Icons.favorite_border,
          cartIcons: CupertinoIcons.bag,
        ),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBox,
              Container(
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: const [
                    shadow,
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: homePageProvider.itemImage.shirts[0].isEmpty
                    ? Image.asset(
                        homePageProvider.itemImage.imagePath,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image,
                              size: 40,
                              color: Colors.black,
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

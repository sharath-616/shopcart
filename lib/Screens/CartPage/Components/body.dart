import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) => SafeArea(
          child: Column(
            children: [
              sizedBox,
              PreferredSize(
                preferredSize: const Size(double.infinity, 80),
                child: CustomAppbar(
                  leading: IconButton(
                    onPressed: () {
                      context.go(HomePage.classId);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  title: 'CartPage',
                ),
              ),

              sizedBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      shadow,
                    ],
                  ),
                  child: Image.asset(
                    homePageProvider.itemImage.shirts[0],
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

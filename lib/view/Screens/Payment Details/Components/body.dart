import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/view/Screens/CartPage/cart_page.dart';
import 'package:shopcart/view/Screens/HomePage/home_page.dart';
import 'package:shopcart/view/Widgets/custom_appbar.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
        preferredSize:  const Size(double.infinity, 80),
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
  
        ),
      ),

      
    );
  }
}
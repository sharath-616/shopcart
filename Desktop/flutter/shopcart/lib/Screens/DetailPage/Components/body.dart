import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Const/local_images.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Screens/CartPage/cart_page.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';
import 'package:shopcart/Widgets/custom_text.dart';
import 'package:shopcart/Widgets/justadd_forusers.dart';

class Body extends StatelessWidget {
  final int index;
  Body({super.key, required this.index});

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
          favoriteIcons: context.watch<HomePageProvider>().isfavor
              ? Icons.favorite
              : Icons.favorite_border,
          cartIcons: CupertinoIcons.bag,
        ),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBox,
              // homePageProvider.cartItems.isNotEmpty
              // ?
              InkWell(
                onTap: () {
                  print(index);
                },
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      shadow,
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    products[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                products[index]['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // : const CustomText(
              //     text: 'Something Went Wrong',
              //     color: Colors.black,
              //     fw: FontWeight.w600,
              //     size: 20,
              //     letterSpacing: 1,
              //   ),
              const JustaddForusers(
                icon: Icons.favorite,
                addText: '30K shoppers wishlisted in last 30Days',
                addColor: Colors.black,
                addSize: 15,
                addfw: FontWeight.bold,
                addspace: 1,
              ),
              sizedBox,
            ],
          ),
        ),
      ),
    );
  }
}

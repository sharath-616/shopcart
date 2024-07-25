import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: CustomAppbar(
          bellFunctions: () {},
          favoriteFunctions: () {
            homePageProvider.clickedfavor();
          },
          cartFunction: () {},
          bellIcons: CupertinoIcons.bell,
          favoriteIcons: homePageProvider.isfavor ? Icons.favorite : Icons.favorite_border,
          cartIcons: CupertinoIcons.bag,
          controller: homePageProvider.userSearchController,
        ),
      ),
    );
  }
}


// ....................................................................

class CustomAppbar extends StatelessWidget {
  final void Function() bellFunctions;
  final void Function() favoriteFunctions;
  final void Function() cartFunction;
  final IconData bellIcons;
  final IconData favoriteIcons;
  final IconData cartIcons;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomAppbar({
    super.key,
    required this.bellFunctions,
    required this.favoriteFunctions,
    required this.cartFunction,
    required this.bellIcons,
    required this.favoriteIcons,
    required this.cartIcons,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 5),
            child: TextFormField(
              controller: controller,
              validator: validator,
              obscureText: obscureText,
              decoration: const InputDecoration(
                hintText: 'Search by product, brand...',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.normal),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: bellFunctions,
          icon: Icon(
            bellIcons,
            size: 30,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: favoriteFunctions,
          icon: Icon(
            favoriteIcons,
            size: 30,
            color: const Color.fromARGB(255, 250, 12, 12),
          ),
        ),
        IconButton(
          onPressed: cartFunction,
          icon: Icon(
            cartIcons,
            size: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

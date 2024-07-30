import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';
import 'package:shopcart/Widgets/custom_text.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppbar(
          leading: IconButton(
            onPressed: () {
              context.go('/home'); 
            },
            icon: const Icon(
              Icons.close,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: 'CartPage',
        ),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) {
          if (homePageProvider.cartItems.isEmpty) {
            return const Center(
              child: CustomText(
                text: 'No More Items',
                size: 30,
                fw: FontWeight.w600,
                letterSpacing: 4,
                color: Colors.black,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: homePageProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItemKey = homePageProvider.cartItems.keys.toList()[index];
                final cartItem = homePageProvider.cartItems[cartItemKey]!;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      if (cartItem.imagePath != null)
                        Image.asset(
                          cartItem.imagePath['image'],
                          fit: BoxFit.cover,
                        ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: cartItem.title,
                              size: 20,
                              fw: FontWeight.bold,
                            ),
                            CustomText(
                              text: '\$${cartItem.price}',
                              size: 18,
                              fw: FontWeight.w500,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Quantity: ${cartItem.quantity}',
                                  size: 16,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.black),
                                  onPressed: () {
                                    homePageProvider.removeItemFromCart(cartItemKey as int);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

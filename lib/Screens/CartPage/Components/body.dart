import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';
import 'package:shopcart/Service/cart_item.dart';
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
              context.go(HomePage.classId);
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
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomText(
                  text: 'No More Item',
                  size: 30,
                  fw: FontWeight.w600,
                  letterSpacing: 4,
                  color: Colors.black,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: homePageProvider.cartItems.length,
              itemBuilder: (context, index) {
                String key = homePageProvider.cartItems.keys.elementAt(index);
                CartItem cartItem = homePageProvider.cartItems[key]!;

                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        shadow,
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBox,
                        CustomText(
                          text: 'Product : (${homePageProvider.cartItemCount})',
                          color: Colors.black,
                          fw: FontWeight.w600,
                          letterSpacing: 2,
                          size: 20,
                        ),
                        sizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (cartItem.imagePath != null && cartItem.imagePath.isNotEmpty)
                              Image.asset(
                                cartItem.imagePath,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
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
                                  CustomText(
                                    text: 'Quantity: ${cartItem.quantity}',
                                    size: 16,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      homePageProvider.removeItemFromCart(key as int);
                                    },
                                    child: const Align(
                                      alignment: Alignment(10, 30),
                                      child: CustomText(
                                        text: 'Remove',
                                        color: Colors.black,
                                        fw: FontWeight.w600,
                                        size: 20,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

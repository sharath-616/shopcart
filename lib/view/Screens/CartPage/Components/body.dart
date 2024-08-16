import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/controller/Service/cart_item.dart';
import 'package:shopcart/controller/Service/total_price.dart';
import 'package:shopcart/view/Screens/HomePage/home_page.dart';
import 'package:shopcart/view/Widgets/custom_appbar.dart';
import 'package:shopcart/view/Widgets/custom_text.dart';

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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Products (${homePageProvider.cartItemCount})',
                      color: Colors.black,
                      fw: FontWeight.w600,
                      letterSpacing: 2,
                      size: 20,
                    ),
                  ],
                ),
              ),
              sizedBox,
              Expanded(
                child: homePageProvider.cartItems.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: CustomText(
                            text: 'No More Items',
                            size: 30,
                            fw: FontWeight.w600,
                            letterSpacing: 4,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : ListView.builder(
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      cartItem.imagePath.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: Image.asset(
                                                cartItem.imagePath,
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: 100,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return const Icon(
                                                    Icons.image,
                                                    size: 40,
                                                    color: Colors.black,
                                                  );
                                                },
                                              ),
                                            )
                                          : const Icon(
                                              Icons.image,
                                              size: 40,
                                              color: Colors.black,
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
                                              text: 'Price: \$${cartItem.price.toStringAsFixed(2)}',
                                              size: 18,
                                              fw: FontWeight.w500,
                                            ),
                                            CustomText(
                                              text: 'Quantity: ${cartItem.quantity}',
                                              size: 16,
                                            ),
                                            divider,
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    homePageProvider.removeItemFromCart(
                                                        key: key, qty: cartItem.quantity, price: cartItem.price);
                                                  },
                                                  child: const CustomText(
                                                    text: 'Remove',
                                                    color: Colors.white,
                                                    fw: FontWeight.w600,
                                                    size: 15,
                                                    letterSpacing: 1,
                                                  ),
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
                      ),
              ),
              const TotalPrice(),
            ],
          );
        },
      ),
    );
  }
}

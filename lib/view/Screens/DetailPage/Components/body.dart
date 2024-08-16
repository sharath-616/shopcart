import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Const/local_images.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/view/Screens/CartPage/cart_page.dart';
import 'package:shopcart/view/Screens/HomePage/home_page.dart';
import 'package:shopcart/view/Screens/Payment%20Details/payment_details.dart';
import 'package:shopcart/view/Widgets/custom_appbar.dart';
import 'package:shopcart/view/Widgets/custom_text.dart';
import 'package:shopcart/view/Widgets/justadd_forusers.dart';

class Body extends StatelessWidget {
  final int index;
  const Body({
    super.key,
    required this.index,
  });

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
              CustomText(
                text: products[index]['name']!,
                color: Colors.black,
                fw: FontWeight.w600,
                size: 20,
                letterSpacing: 1,
              ),
              CustomText(
                text: products[index]['price']!,
                color: Colors.black,
                fw: FontWeight.w600,
                size: 20,
                letterSpacing: 1,
              ),
              const JustaddForusers(
                icon: Icons.favorite,
                addText: '30K shoppers wishlisted in last 30Days',
                addColor: Colors.black,
                addSize: 15,
                addfw: FontWeight.bold,
                addspace: 1,
              ),
              sizedBox,
              homePageProvider.cartItems.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            shadow,
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              context.go(CartPage.classId);
                              homePageProvider.addItemToCart(
                                'shirt$index',
                                1000,
                                products[index]['name']!,
                                products[index]['image']!,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: CustomText(
                                    text: '${products[index]['name']!} added to cart!',
                                    size: 15,
                                    color: Colors.white,
                                    fw: FontWeight.bold,
                                    letterSpacing: 3,
                                  ),
                                ),
                              );
                            },
                            child: const CustomText(
                              text: 'Add to cart',
                              color: Colors.white,
                              fw: FontWeight.bold,
                              size: 20,
                            )),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            shadow,
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.go(PaymentDetails.classId);
                          },
                          child: const CustomText(
                            text: 'Proceed to pay',
                            color: Colors.white,
                            fw: FontWeight.bold,
                            size: 20,
                          ),
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

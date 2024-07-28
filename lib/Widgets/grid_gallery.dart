import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Widgets/custom_text.dart';

class GridGallery extends StatelessWidget {
  const GridGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Center(
            child: CustomText(
              text: 'Top Brands',
              size: 20,
              color: Colors.white,
              fw: FontWeight.w600,
              letterSpacing: 3,
            ),
          ),
        ),
        Consumer<HomePageProvider>(
          builder: (context, homePageProvider, child) => homePageProvider.itemImage.shirts.isEmpty
              ? const CustomText(text: 'No items available')
              : SizedBox(
                  height: 300,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 0.01,
                    ),
                    itemCount: homePageProvider.itemImage.shirts.length,
                    itemBuilder: (context, index) {
                      final shirt = homePageProvider.itemImage.shirts[index];
                      final shirtName = homePageProvider.itemImage.itemName[index];
                      final shirtPrice = homePageProvider.itemImage.itemPrice[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [shadow],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                child: Image.asset(
                                  shirt,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: shirtName,
                                          size: 15,
                                          color: Colors.black,
                                          fw: FontWeight.bold,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            homePageProvider.clickedfavor();
                                          },
                                          icon: homePageProvider.isfavor
                                              ? const Icon(
                                                  Icons.favorite,
                                                  size: 20,
                                                  color: Colors.red,
                                                )
                                              : const Icon(
                                                  Icons.favorite_border,
                                                  size: 20,
                                                  color: Colors.red,
                                                ),
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                      text: shirtPrice,
                                      size: 15,
                                      color: Colors.black,
                                      fw: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () {
                                    homePageProvider.addItemToCart(
                                      'shirt$index',
                                      1000,
                                      shirtName,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: CustomText(
                                          text: '$shirtName added to cart!',
                                          size: 15,
                                          color: Colors.white,
                                          fw: FontWeight.bold,
                                          letterSpacing: 3,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: Colors.black,
                                    ),
                                    child: const Center(
                                      child: CustomText(
                                        text: 'Add to Cart',
                                        size: 15,
                                        color: Colors.white,
                                        fw: FontWeight.bold,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                            
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),

          sizedBox,
      ],
    );
  }
}

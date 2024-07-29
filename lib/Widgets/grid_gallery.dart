import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Const/local_images.dart';
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
          builder: (context, homePageProvider, child) => homePageProvider
                  .itemImage.shirts.isEmpty
              ? const CustomText(text: 'No items available')
              : SizedBox(
                  // height: 300,
                  child: GridView.builder(
                    shrinkWrap: true, //shrink wrap true
                    physics:
                        const NeverScrollableScrollPhysics(), //scroll phisics changed
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 0.01,
                    ),
                    itemCount: products.length, //ProductList of Map
                    // itemCount: homePageProvider.itemImage.shirts.length,
                    itemBuilder: (context, index) {
                      // final shirt = homePageProvider.itemImage.shirts[index];
                      // final shirtName =
                      //     homePageProvider.itemImage.itemName[index];
                      // final shirtPrice =
                      //     homePageProvider.itemImage.itemPrice[index];
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
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  child: Image.asset(
                                    products[index]['image']!,
                                    fit: BoxFit.cover,
                                    // height: 150,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 1, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: products[index]['name']!,
                                          size: 15,
                                          color: Colors.black,
                                          fw: FontWeight.bold,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            homePageProvider.addToWishList(
                                                products[
                                                    index]); //Add to WishList
                                            // homePageProvider.clickedfavor();
                                          },
                                          child: homePageProvider.isfavor
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
                                      text: products[index]['price']!,
                                      size: 15,
                                      color: Colors.black,
                                      fw: FontWeight.bold,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        color: Colors.black,
                                        onPressed: () {
                                          homePageProvider.addItemToCart(
                                            'shirt$index',
                                            1000,
                                            products[index]['name']!,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: CustomText(
                                                text:
                                                    '${products[index]['name']!} added to cart!',
                                                size: 15,
                                                color: Colors.white,
                                                fw: FontWeight.bold,
                                                letterSpacing: 3,
                                              ),
                                            ),
                                          );
                                        },
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
                                  ],
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

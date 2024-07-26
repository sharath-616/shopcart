import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Screens/CartPage/cart_page.dart';
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
          builder: (context, homePageProvider, child) => homePageProvider.itemImage.pants.isEmpty
              ? const CustomText(text: 'No items available')
              : SizedBox(
                  height:500,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: homePageProvider.itemImage.shirts.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          context.go(CartPage.classId);
                        },
                        child: Container(
                          height: 400,
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
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image(
                                  image: AssetImage(
                                    homePageProvider.itemImage.shirts[index],
                                  ),
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CustomText(
                                        text: 'price : 1000 ',
                                        size: 15,
                                        color: Colors.black,
                                        fw: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          size: 15,
                                          color: Colors.red,
                                        ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

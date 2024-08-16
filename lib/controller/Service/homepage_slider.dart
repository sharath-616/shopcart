import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/view/Widgets/custom_text.dart';

class HomepageSlider extends StatelessWidget {
  const HomepageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) => homePageProvider.itemImage.shirts.isEmpty
            ? const Center(
                child: CustomText(text: 'No items available'),
              )
            : Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: homePageProvider.pageViewController,
                    itemCount: homePageProvider.itemImage.shirts.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          shadow,
                        ],
                      ),
                      child: Image.asset(
                        homePageProvider.itemImage.shirts[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ));
  }
}

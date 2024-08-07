import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Widgets/custom_text.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, homePageProvider, child) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomText(
                    text: 'Total: \$${homePageProvider.cartTotal}',
                    color: Colors.black,
                    fw: FontWeight.w600,
                    size: 20,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        shadow,
                      ],
                      color: Colors.black),
                  child: TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        text: 'Proceed to Payment',
                        color: Colors.white,
                        size: 20,
                        fw: FontWeight.w600,
                        letterSpacing: 1,
                      )),
                ),
                sizedBox,
              ],
            ));
  }
}

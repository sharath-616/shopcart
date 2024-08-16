import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/view/Screens/Payment%20Details/payment_details.dart';
import 'package:shopcart/view/Widgets/custom_text.dart';


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
                    text: 'Total: \$${homePageProvider.totalCartAmount.toStringAsFixed(2)}',
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
                    onPressed: () {
                      context.go(PaymentDetails.classId);
                    },
                    child: const CustomText(
                      text: 'Proceed to pay',
                      color: Colors.white,
                      size: 20,
                      fw: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                sizedBox,
              ],
            ));
  }
}

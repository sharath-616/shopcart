import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: 'CartPage',
        ),
      ),
    );
  }
}

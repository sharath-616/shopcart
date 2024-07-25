import 'package:flutter/material.dart';
import 'package:shopcart/Widgets/custom_appbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
     appBar: PreferredSize(preferredSize: Size(double.infinity, 80), child: ShopAppBar()),
    );
  }
}
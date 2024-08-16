import 'package:flutter/material.dart';
import 'package:shopcart/view/Screens/DetailPage/Components/body.dart';

class DetailsPage extends StatelessWidget {
  static const classId = '/details_page';
   final int index;
  const DetailsPage({super.key, required this.index, });

  @override
  Widget build(BuildContext context) {
    return  Body(index: index,);
  }
}

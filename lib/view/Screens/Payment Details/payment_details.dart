import 'package:flutter/material.dart';
import 'package:shopcart/view/Screens/DetailPage/Components/body.dart';


class PaymentDetails extends StatelessWidget {
  static const classId = '/payment_details';
  int index;
   PaymentDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Body(index: index,);
  }
}
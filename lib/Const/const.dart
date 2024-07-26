import 'package:flutter/material.dart';

const sizedBox = SizedBox(
  height: 50,
  width: 20,
);

const shadow = BoxShadow(
  color: Color.fromRGBO(149, 157, 165, 0.2),
  blurRadius: 24,
  spreadRadius: 0,
  offset: Offset(
    0,
    8,
  ),
);

const horizontalDivider = SizedBox(
  width: double.infinity,
  child: Divider(
    thickness: 2,
    color: Colors.grey,
    indent: 20,
    endIndent: 20,
  ),
);



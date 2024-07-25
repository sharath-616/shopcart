import 'package:flutter/material.dart';
import 'package:shopcart/Const/const.dart';

class CustomTextformField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()  function;
  final TextInputType? keyboardType;

  const CustomTextformField(
      {super.key,
      this.hintText,
      this.labelText,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon, required this.function, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20, right:20, top: 10, bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            shadow,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 10),
          child: TextFormField(
            keyboardType: keyboardType,
            onTap: function,
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
              labelText: labelText,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}

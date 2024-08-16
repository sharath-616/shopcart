import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Const/const.dart';
import 'package:shopcart/controller/Provider/LoginPageProvider/loginpage_provider.dart';
import 'package:shopcart/view/Screens/HomePage/home_page.dart';
import 'package:shopcart/view/Widgets/custom_text.dart';
import 'package:shopcart/view/Widgets/custom_textform_field.dart';


class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LoginpageProvider>(
            builder: (context, loginprovider, child) => Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: 'Login',
                        color: Colors.black,
                        fw: FontWeight.w500,
                        letterSpacing: 3,
                        size: 30,
                        fontFamily: '',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: CustomText(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      color: Colors.black,
                      size: 15,
                      fw: FontWeight.normal,
                    ),
                  ),
                  CustomTextformField(
                    keyboardType: TextInputType.number,
                    hintText: 'User Name',
                    labelText: 'User Name',
                    controller: loginprovider.userNameControll,
                    function: () {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Number';
                      } else if (value.length > 11) {
                        return 'Number cannot be more than 11 digits';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextformField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    labelText: 'Password',
                    controller: loginprovider.userPassControll,
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginprovider.togglerbutton();
                      },
                      icon: loginprovider.isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                              size: 20,
                            )
                          : const Icon(Icons.visibility_off),
                    ),
                    function: () {},
                    obscureText: !loginprovider.isVisible,
                  ),
                  sizedBox,
                  SizedBox(
                    width: 200,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: CustomText(
                                text: 'Processing Data',
                                size: 20,   
                                color: Colors.black,
                              ),
                            ),
                          );

                          bool success = await loginprovider.postData();

                          if (success) {
                            context.go(HomePage.classId);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: CustomText(
                                text: 'Login Failed',
                                size: 20,
                                color: Colors.red,
                              ),
                            ));
                          }

                          loginprovider.userNameControll.clear();
                          loginprovider.userPassControll.clear();
                        }
                      },
                      child: const CustomText(
                        text: 'Login',
                        color: Colors.white,
                        fw: FontWeight.w600,
                        size: 20,
                        letterSpacing: 5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

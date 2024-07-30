import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Widgets/custom_text.dart';

class CustomAppbar extends StatelessWidget {
  final void Function()? bellFunctions;
  final void Function()? favoriteFunctions;
  final void Function()? cartFunction;
  final IconData? bellIcons;
  final IconData? favoriteIcons;
  final IconData? cartIcons;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? title;
  final Widget? leading;

  const CustomAppbar({
    super.key,
    this.bellFunctions,
    this.favoriteFunctions,
    this.cartFunction,
    this.bellIcons,
    this.favoriteIcons,
    this.cartIcons,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
      elevation: 0,
      leading: leading,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          : Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  obscureText: obscureText,
                  decoration: const InputDecoration(
                    hintText: 'Search by product, brand...',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
            ),
      actions: [
        if (bellIcons != null)
          IconButton(
            onPressed: bellFunctions,
            icon: Icon(
              bellIcons,
              size: 30,
              color: Colors.black,
            ),
          ),
        if (favoriteIcons != null)
          Badge(
            label: Text(
                '${Provider.of<HomePageProvider>(context).wishList.length}'),
            child: InkWell(
              onTap: favoriteFunctions,
              child: Icon(
                favoriteIcons,
                size: 30,
                color: const Color.fromARGB(255, 250, 12, 12),
              ),
            ),
          ),
        if (cartIcons != null)
          Stack(
            children: [
              IconButton(
                onPressed: cartFunction,
                icon: Icon(
                  cartIcons,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Consumer<HomePageProvider>(
                builder: (context, homePageProvider, child) {
                  return homePageProvider.cartItemCount > 0
                      ? Positioned(
                          right: 6,
                          top: 10,
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Center(
                                child: CustomText(
                              text: '${homePageProvider.cartItemCount}',
                              size: 10,
                              color: Colors.white,
                              fw: FontWeight.bold,
                            )),
                          ),
                        )
                      : Container();
                },
              ),
            ],
          ),
      ],
    );
  }
}

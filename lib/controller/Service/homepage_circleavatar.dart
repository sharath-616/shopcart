import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/view/Widgets/custom_text.dart';


class HomepageCircleavatar extends StatelessWidget {
  const HomepageCircleavatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) => homePageProvider.itemImage.shirts.isEmpty
          ? const CustomText(text: 'No items available')
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homePageProvider.itemImage.shirts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 3),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0, left: 1, right: 1, top: 0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.home,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    } else {
                      final itemIndex = index - 1;
                      return Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(homePageProvider.itemImage.shirts[itemIndex]),
                          ),
                          const SizedBox(width: 8),
                          CustomText(
                            text: homePageProvider.itemImage.itemText[itemIndex],
                          ),
                          const SizedBox(width: 15),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Widgets/custom_text.dart';

class HomepageAdds extends StatelessWidget {
  const HomepageAdds({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) => homePageProvider.itemImage.adds.isEmpty
          ? const CustomText(text: 'No items available')
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homePageProvider.itemImage.adds.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 4,
                    )),
                    child: Image(
                      image: AssetImage(homePageProvider.itemImage.adds[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

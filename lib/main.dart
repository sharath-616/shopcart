import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/controller/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/controller/Provider/LoginPageProvider/loginpage_provider.dart';
import 'package:shopcart/view/Screens/CartPage/cart_page.dart';
import 'package:shopcart/view/Screens/DetailPage/details_page.dart';
import 'package:shopcart/view/Screens/HomePage/home_page.dart';
import 'package:shopcart/view/Screens/Payment%20Details/payment_details.dart';
import 'package:shopcart/view/Screens/VishListPage/vish_list_page.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginpageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Shop Cart',
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: HomePage.classId,
  routes: [
    GoRoute(
      path: HomePage.classId,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: DetailsPage.classId,
      builder: (context, state) {
        final index = int.parse(state.uri.queryParameters['index']!);
        return DetailsPage(index: index);
      },
    ),
    GoRoute(
      path: CartPage.classId,
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
        path: PaymentDetails.classId,
        builder: (context, state) {
          final index = int.parse(state.uri.queryParameters['index']!);
          return PaymentDetails(
            index: index,
          );
        }),

          GoRoute(
      path: VishListPage.classId,
      builder: (context, state) => const VishListPage(),
    ),
  ],
);

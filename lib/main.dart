import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Provider/HomepageProvider/home_page_provider.dart';
import 'package:shopcart/Provider/LoginPageProvider/loginpage_provider.dart';
import 'package:shopcart/Screens/CartPage/cart_page.dart';
import 'package:shopcart/Screens/DetailPage/details_page.dart';
import 'package:shopcart/Screens/HomePage/home_page.dart';

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
      builder: (context, state) => const DetailsPage(),
    ),
    GoRoute(
      path: CartPage.classId,
      builder: (context, state) => const CartPage(),
    ),
  ],
);

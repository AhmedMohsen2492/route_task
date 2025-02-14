import 'package:ecommerce_route/domain/di/di.dart';
import 'package:ecommerce_route/ui/screens/products/products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsScreen.routeName,
      routes: {
        ProductsScreen.routeName: (context) => const ProductsScreen(),
      },
    );
  }
}

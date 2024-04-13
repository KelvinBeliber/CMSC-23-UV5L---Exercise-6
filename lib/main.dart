import 'package:flutter/material.dart';
import 'package:my_app/screen/Checkout.dart'; // Import Checkout page
import 'package:my_app/screen/MyCart.dart'; // Import MyCart page
import 'package:my_app/screen/MyCatalog.dart'; // Import MyCatalog page
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart'; // Import ShoppingCart provider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ShoppingCart()), // Provide ShoppingCart instance
      ],
      child: const MyApp(), // Wrap the app with MultiProvider and MyApp widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(), // Define route for MyCart page
        "/products": (context) =>
            const MyCatalog(), // Define route for MyCatalog page
        "/checkout": (context) => Checkout(), // Define route for Checkout page
      },
      home: const MyCatalog(), // Set MyCatalog page as home page
    );
  }
}

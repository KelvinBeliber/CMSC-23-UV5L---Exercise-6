import 'package:flutter/material.dart';
import '../model/Item.dart'; // Import Item model
import 'package:provider/provider.dart'; // Import Provider package
import '../provider/shoppingcart_provider.dart'; // Import ShoppingCart provider

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  // List of products in the catalog
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Catalog")),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.star),
            title: Text(
                "${productsCatalog[index].name} - ${productsCatalog[index].price}"), // Display product name and price
            trailing: TextButton(
              child: const Text("Add"), // Button to add product to cart
              onPressed: () {
                context
                    .read<ShoppingCart>()
                    .addItem(productsCatalog[index]); // Add product to cart
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  // Show snackbar to confirm product addition
                  content: Text("${productsCatalog[index].name} added!"),
                  duration: const Duration(seconds: 1, milliseconds: 100),
                ));
              },
            ),
          );
        },
        itemCount: productsCatalog.length, // Total number of products
      ),
      floatingActionButton: FloatingActionButton(
        // Floating action button to navigate to cart
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, "/cart"); // Navigate to cart page
        },
      ),
    );
  }
}

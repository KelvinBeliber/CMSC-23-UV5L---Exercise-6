import 'package:flutter/material.dart';
import '../model/Item.dart'; // Import Item model
import 'package:provider/provider.dart'; // Import Provider package
import '../provider/shoppingcart_provider.dart'; // Import ShoppingCart provider
import 'Checkout.dart'; // Import Checkout page

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalCost = context
        .watch<ShoppingCart>()
        .cartTotal; // Get total cost from ShoppingCart provider

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context), // Display items in cart
          const Divider(height: 4, color: Colors.black),
          ElevatedButton(
            // Checkout button
            onPressed: () {
              if (context.read<ShoppingCart>().cart.isNotEmpty) {
                // Check if cart is not empty
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Checkout())); // Navigate to Checkout page
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("No items to checkout"),
                  duration: Duration(seconds: 1, milliseconds: 100),
                )); // Show snackbar if cart is empty
              }
            },
            child: const Text("Checkout"),
          ),
          ElevatedButton(
            // RESET button
            onPressed: () {
              context
                  .read<ShoppingCart>()
                  .removeAll(); // Remove all items from cart
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Cart Reset"),
                duration: Duration(seconds: 1, milliseconds: 100),
              )); // Show snackbar to confirm cart reset
            },
            child: const Text("RESET"),
          ),
          Text("Total: $totalCost"), // Display total amount
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products =
        context.watch<ShoppingCart>().cart; // Get items from cart
    String productname = "";
    return products.isEmpty
        ? const Text('No Items yet!') // Display message if cart is empty
        : Expanded(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.food_bank),
                        title: Text(products[index].name),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            productname = products[index].name;
                            context.read<ShoppingCart>().removeItem(
                                productname); // Remove item from cart
                            if (products.isNotEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("$productname removed!"),
                                duration: const Duration(
                                    seconds: 1, milliseconds: 100),
                              )); // Show snackbar to confirm item removal
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Cart Empty!"),
                                duration:
                                    Duration(seconds: 1, milliseconds: 100),
                              )); // Show snackbar if cart is empty
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

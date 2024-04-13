import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import '../provider/shoppingcart_provider.dart'; // Import ShoppingCart provider

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalCost = context
        .watch<ShoppingCart>()
        .cartTotal; // Get total cost from ShoppingCart provider

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Total Cost to Pay: $totalCost"), // Display total amount to pay
            ElevatedButton(
              // Pay Now button
              onPressed: () {
                context.read<ShoppingCart>().removeAll(); // Clear shopping cart
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  // Show snackbar for payment successful
                  content: Text("Payment Successful"),
                  duration: Duration(seconds: 1, milliseconds: 100),
                ));
              },
              child: const Text("Pay Now"), // Button text
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../model/Item.dart'; // Import Item model

class ShoppingCart with ChangeNotifier {
  final List<Item> _shoppingList = []; // List to store shopping items
  double cartTotal = 0; // Total cost of items in the cart

  List<Item> get cart => _shoppingList; // Getter for shopping cart items

  // Method to add an item to the shopping cart
  void addItem(Item item) {
    _shoppingList.add(item); // Add item to the list
    cartTotal = cartTotal + item.price; // Update total cost
    notifyListeners(); // Notify listeners of state change
  }

  // Method to remove all items from the shopping cart
  void removeAll() {
    _shoppingList.clear(); // Clear the list
    cartTotal = 0; // Reset total cost
    notifyListeners(); // Notify listeners of state change
  }

  // Method to remove a specific item from the shopping cart by name
  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) {
        cartTotal = cartTotal -
            _shoppingList[i].price; // Subtract item price from total cost
        _shoppingList.remove(_shoppingList[i]); // Remove item from the list
        break; // Exit loop once item is removed
      }
    }
    notifyListeners(); // Notify listeners of state change
  }

  // Method to clear the shopping cart and reset total cost (simulates paying for items)
  void payNow() {
    _shoppingList.clear(); // Clear the list
    cartTotal = 0; // Reset total cost
    notifyListeners(); // Notify listeners of state change
  }
}

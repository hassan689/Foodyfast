import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart'; // Import your CartProvider

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty!',
                style:  TextStyle(
                  color: Color.fromARGB(255, 228, 244, 41),
                  fontSize: 18,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items.values.toList()[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: Text(
                              item.quantity.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '\$${item.price * item.quantity}',
                            style: const TextStyle(color: Colors.green),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              cart.removeItem(item.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text(
                        'Total:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 228, 244, 41),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                    ),
                    onPressed: () {
                      if (cart.items.isNotEmpty) {
                        cart.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Order placed successfully!',
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.yellow,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

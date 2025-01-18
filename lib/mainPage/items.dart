import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'food_item.dart';
class AvailableItems extends StatefulWidget {
  const AvailableItems({super.key});
  @override
  State<AvailableItems> createState() => _AvailableItemsState();
}

class _AvailableItemsState extends State<AvailableItems> {
  Color backgroundColor = Colors.black;
  final List<FoodItem> foodItems = [
    FoodItem(id: '1', name: 'chips', price: 10, image: 'assets/images/fries.png'),
    FoodItem(id: '2', name: 'pasta', price: 100, image: 'assets/images/pasta.jpg'),
    FoodItem(id: '3', name: 'pizza', price: 120, image: 'assets/images/pizza.png'),
    FoodItem(id: '4',name: 'rice',price: 150,image: 'assets/images/whiterice.jpg'),
    FoodItem(id: '5',name: 'biryani',price: 200,image: 'assets/images/biryani.png'),
    FoodItem(id: '6', name: 'burger', price: 0, image: 'assets/images/burger.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
       
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.yellow),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CartScreen()),
              // );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Choose your item to eat !!",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 228, 244, 41),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: 'Search Here',
                    hintStyle: GoogleFonts.aDLaMDisplay(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 228, 244, 41),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 228, 244, 41),
                      ),
                      child: Center(
                        child: Text(
                          'New building cafe',
                          style: GoogleFonts.aDLaMDisplay(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 228, 244, 41),
                      ),
                      child: Center(
                        child: Text(
                          'Bahir ki chips',
                           
                          style: GoogleFonts.aDLaMDisplay(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  //  print(foodItems.length);
                  final item = foodItems[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            '${item.name} :Rs ${item.price}',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addItem(item);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: 2,
        backgroundColor: const Color.fromARGB(255, 228, 244, 41),
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'profile'),
        ],
      ),
    );
  }
}

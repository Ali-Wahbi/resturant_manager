import 'package:flutter/material.dart';
import 'Food.dart';
import 'containers.dart';

/// Display the menu in a screen with different sections for the customer
class MenuSelectScreen extends StatefulWidget {
  const MenuSelectScreen({super.key, required this.title});
  final String title;

  @override
  State<MenuSelectScreen> createState() => _MenuSelectScreenState();
}

class _MenuSelectScreenState extends State<MenuSelectScreen> {
  /// count the total price to display later to the customer
  double totalPrice = 0;

  // menues:
  List<Food> mainDishes = [
    Food(foodName: 'Asida', price: 200, imageUrl: 'images/Kesra.jpg'),
    Food(foodName: 'Kisra', price: 250, imageUrl: 'images/Kesra.jpg'),
  ];

  List<Food> sideDishes = [
    Food(foodName: 'Kabab', price: 100, imageUrl: 'images/kabab.jpg'),
    Food(foodName: 'Falafel', price: 150, imageUrl: 'images/Falafel.jpeg'),
    Food(foodName: 'Ful Medames', price: 100, imageUrl: 'images/Kabab.jpg'),
  ];

  List<Food> beverages = [
    Food(
      foodName: 'Mango juice',
      price: 200,
      imageUrl: 'images/Juice Mango.jpg',
    ),
    Food(
      foodName: 'Orange juice',
      price: 200,
      imageUrl: 'images/Juice Orange.jpg',
    ),
    Food(
      foodName: 'Apple juice',
      price: 200,
      imageUrl: 'images/Juice Apple.jpg',
    ),
  ];
  
  List<Food> salads = [
    Food(foodName: 'Roab Salad', price: 150, imageUrl: 'images/Salad Roab.jpg'),
    Food(
      foodName: 'Green Salad',
      price: 150,
      imageUrl: 'images/Salad Green.jpg',
    ),
    Food(foodName: 'Dakwa Salad', price: 100, imageUrl: 'images/Dakoa.jpg'),
  ];
  
  
  Color mainDishColor = const Color.fromARGB(75, 244, 67, 54);
  Color beverageColor = const Color.fromARGB(75, 33, 149, 243);
  Color sideDishColor = const Color.fromARGB(75, 255, 235, 59);
  Color saladColor = const Color.fromARGB(75, 76, 175, 79);


  @override
  Widget build(BuildContext context) {
    Color containerColor = Color.fromARGB(255, 29, 0, 38);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Food",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          foodDisplayContainer(
            mainDishColor,
            "Main Dishes",
            mainDishes,
            onContainerClick,
          ),
          foodDisplayContainer(
            sideDishColor,
            "Side Dishes",
            sideDishes,
            onContainerClick,
          ),
          foodDisplayContainer(
            beverageColor,
            "Beverages",
            beverages,
            onContainerClick,
          ),
          foodDisplayContainer(saladColor, "Salads", salads, onContainerClick),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialoge();
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Container foodDisplayContainer(
    Color containerColor,
    String title,
    List<Food> foodContainer,
    Function(double, bool) onContainerClick,
  ) {
    return Container(
      color: containerColor,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1.1,
            ),
            children: [...buildContainers(foodContainer, onContainerClick)],
          ),
        ],
      ),
    );
  }

  List<Widget> buildContainers(
    List<Food> foodContainer,
    Function(double, bool) onContainerClick,
  ) {
    List<Widget> containerList = [];

    for (var food in foodContainer) {
      containerList.add(
        SelectableContainer(
          foodName: food.foodName,
          foodImageUrl: food.imageUrl,
          price: food.price,
          onContainerClick: onContainerClick,
        ),
      );
    }
    return containerList;
  }

  Future openDialoge() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Total"),
      content: Text("Bill: ${totalPrice.toInt()} SDG"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Finish"),
        ),
      ],
    ),
  );

    /// adjust the total price
  void onContainerClick(double price, bool isSelected) {
    if (isSelected) {
      totalPrice += price;
    } else {
      totalPrice -= price;
    }
  }

}

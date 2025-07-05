import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 90, 52, 206),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 203, 255),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SelectableContainer extends StatefulWidget {

  SelectableContainer({
    super.key,
    required this.foodName,
    required this.foodImageUrl,
    required this.foodType,
    required this.price,
    required this.onContainerClick,
  });

  final String foodName;
  final String foodImageUrl;
  final FoodType foodType;

  double price = 100;
  int amount = 0;
  bool isSelected = false;
  Function(double, bool) onContainerClick;

  double containerWidth = 50;
  double containerHeight = 50;

  @override
  State<SelectableContainer> createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  @override
  Widget build(BuildContext context) {
    return FoodContainer(
      widget: widget,
      onClick: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
          widget.onContainerClick(widget.price, widget.isSelected);
        });
      },
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key, required this.widget, required this.onClick});

  final SelectableContainer widget;
  final Function onClick;

  Widget? DecrementButton() {
    if (widget.amount > 0) {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(),
        child: Icon(Icons.exposure_minus_1),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: widget.containerWidth,
        height: widget.containerHeight,
        color: widget.isSelected
            ? const Color.fromARGB(255, 246, 238, 254)
            : const Color.fromARGB(0, 255, 255, 255),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.all(10.0),
              color: const Color.fromARGB(0, 73, 54, 244),
              child: Image(
                image: AssetImage(widget.foodImageUrl),
                width: 30,
                height: 30,
              ),
            ),
            Text(
              widget.foodName,
              style: TextStyle(
                color: const Color.fromARGB(255, 19, 22, 21),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                // DecrementButton() ?? Container(),
                Text(
                  "${widget.price} SDG",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 86, 50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  double totalPrice = 0;
  List<Food> mainDishes = [
    Food(
      foodName: 'Asida',
      foodType: FoodType.mainDish,
      price: 200,
      imageUrl: 'images/Kesra.jpg',
    ),
    Food(
      foodName: 'Kisra',
      foodType: FoodType.mainDish,
      price: 250,
      imageUrl: 'images/Kesra.jpg',
    ),
  ];

  List<Food> sideDishes = [
    Food(
      foodName: 'Kabab',
      foodType: FoodType.sideDish,
      price: 100,
      imageUrl: 'images/kabab.jpg',
    ),
    Food(
      foodName: 'Falafel',
      foodType: FoodType.sideDish,
      price: 150,
      imageUrl: 'images/Falafel.jpeg',
    ),
    Food(
      foodName: 'Ful Medames',
      foodType: FoodType.sideDish,
      price: 100,
      imageUrl: 'images/Kabab.jpg',
    ),
  ];

  List<Food> beverages = [
    Food(
      foodName: 'Mango juice',
      foodType: FoodType.beverage,
      price: 200,
      imageUrl: 'images/Juice Mango.jpg',
    ),
    Food(
      foodName: 'Orange juice',
      foodType: FoodType.beverage,
      price: 200,
      imageUrl: 'images/Juice Orange.jpg',
    ),
    Food(
      foodName: 'Apple juice',
      foodType: FoodType.beverage,
      price: 200,
      imageUrl: 'images/Juice Apple.jpg',
    ),
  ];
  List<Food> salads = [
    Food(
      foodName: 'Roab Salad',
      foodType: FoodType.salad,
      price: 150,
      imageUrl: 'images/Salad Roab.jpg',
    ),
    Food(
      foodName: 'Green Salad',
      foodType: FoodType.salad,
      price: 150,
      imageUrl: 'images/Salad Green.jpg',
    ),
    Food(
      foodName: 'Dakwa Salad',
      foodType: FoodType.salad,
      price: 100,
      imageUrl: 'images/Dakoa.jpg',
    ),
  ];
  Color mainDishColor = const Color.fromARGB(75, 244, 67, 54);
  Color beverageColor = const Color.fromARGB(75, 33, 149, 243);
  Color sideDishColor = const Color.fromARGB(75, 255, 235, 59);
  Color saladColor = const Color.fromARGB(75, 76, 175, 79);

  // ignore: unused_element
  void _setState() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  void onContainerClick(double price, bool isSelected) {
    if (isSelected) {
      totalPrice += price;
    } else {
      totalPrice -= price;
    }
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

  List<Widget> buildContainers(
    List<Food> foodContainer,
    Function(double, bool) onContainerClick,
  ) {
    List<Widget> containerList = [];

    for (var food in foodContainer) {
      containerList.add(
        SelectableContainer(
          foodName: food.foodName,
          foodType: food.foodType,
          foodImageUrl: food.imageUrl,
          price: food.price,
          onContainerClick: onContainerClick,
        ),
      );
    }
    return containerList;
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
}

class Food {
  String foodName;
  FoodType foodType;
  double price;
  String imageUrl = 'images/MaddyMueller.jpeg';
  Food({
    required this.foodName,
    required this.foodType,
    required this.price,
    this.imageUrl = 'images/MaddyMueller.jpeg',
  });
}

enum FoodType { mainDish, sideDish, beverage, salad }

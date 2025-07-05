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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
  });

  final String foodName;
  final String foodImageUrl;
  final FoodType foodType;
  double price = 100;
  bool isSelected = false;

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
        });
      },
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key, required this.widget, required this.onClick});

  final SelectableContainer widget;
  final Function onClick;
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
            Text(
              "${widget.price} SDG",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 86, 50),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;

  List<Food> mainDishes = [
    Food(foodName: 'Asida', foodType: FoodType.mainDish, price: 200),
    Food(foodName: 'Kisra', foodType: FoodType.mainDish, price: 250),
    Food(foodName: 'Kisra', foodType: FoodType.mainDish, price: 250),
    Food(foodName: 'Kisra', foodType: FoodType.mainDish, price: 250),
  ];

  List<Food> sideDishes = [
    Food(foodName: 'Kabab', foodType: FoodType.sideDish, price: 100),
    Food(foodName: 'Falafel', foodType: FoodType.sideDish, price: 150),
    Food(foodName: 'Ful Medames', foodType: FoodType.sideDish, price: 100),
  ];

  List<Food> beverages = [
    Food(foodName: 'Mango juice', foodType: FoodType.beverage, price: 200),
    Food(foodName: 'Mango juice', foodType: FoodType.beverage, price: 200),
    Food(foodName: 'Mango juice', foodType: FoodType.beverage, price: 200),
  ];
  List<Food> salads = [
    Food(foodName: 'Aubergine Salad', foodType: FoodType.salad, price: 100),
    Food(foodName: 'Roab Salad', foodType: FoodType.salad, price: 150),
    Food(foodName: 'Green Salad', foodType: FoodType.salad, price: 150),
    Food(foodName: 'Toomia', foodType: FoodType.salad, price: 100),
    Food(foodName: 'Dakoa Salad', foodType: FoodType.salad, price: 100),
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
      // body: ListView(children: [...buildContainers()]),
      body: ListView(
        children: [
          foodDisplayContainer(mainDishColor, "Main Dishes", mainDishes),
          // foodDisplayContainer(sideDishColor, "Side Dishes", sideDishs),
          // foodDisplayContainer(beverageColor, "Beverages", beverages),
          // foodDisplayContainer(saladColor, "Salads", salads),
        ],
      ),
    );
  }

  List<Widget> buildContainers(List<Food> foodContainer) {
    List<Widget> containerList = [];
    //  SelectableContainer(foodName: "Kabab", price: 150,)
    // containers.forEach((key, value) {
    //   containerList.add(
    //     Container(color: key, height: value)
    //     );
    // });

    for (var food in foodContainer) {
      containerList.add(
        SelectableContainer(
          foodName: food.foodName,
          foodType: food.foodType,
          foodImageUrl: food.imageUrl,
          price: food.price,
        ),
      );
    }
    return containerList;
  }

  Container foodDisplayContainer(
    Color containerColor,
    String title,
    List<Food> foodContainer,
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
            children: [...buildContainers(foodContainer)],
          ),
          Spacer(),
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
  Food({required this.foodName, required this.foodType, required this.price});
}

enum FoodType { mainDish, sideDish, beverage, salad }

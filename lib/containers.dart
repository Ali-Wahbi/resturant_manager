import 'package:flutter/material.dart';

/// contains an element that can
// ignore: must_be_immutable
class SelectableContainer extends StatefulWidget {
  SelectableContainer({
    super.key,
    required this.foodName,
    required this.foodImageUrl,
    required this.price,
    required this.onContainerClick,
  });

  final String foodName;
  final String foodImageUrl;
  double price = 100;
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

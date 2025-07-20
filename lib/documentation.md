# Project Documentation

This document provides an overview of the Dart classes within the `lib` directory.

## File: `lib/containers.dart`

This file contains widgets related to displaying food items in a selectable container.

---

### `SelectableContainer`

A stateful widget that represents a selectable container for a food item. It is designed to display a food's image, name, and price. It can be tapped to select or deselect it.

**Properties:**

| Name | Type | Description |
| --- | --- | --- |
| `foodName` | `String` | The name of the food item to be displayed. |
| `foodImageUrl` | `String` | The asset path for the food item's image. |
| `price` | `double` | The price of the food item. It has a default value of `100`. |
| `onContainerClick` | `Function(double, bool)` | A callback function that is executed when the container is tapped. It receives the price and the new selection state (`isSelected`). |
| `isSelected` | `bool` | A boolean that indicates whether the container is currently selected. Defaults to `false`. |
| `containerWidth` | `double` | The width of the container. Defaults to `50`. |
| `containerHeight`| `double` | The height of the container. Defaults to `50`. |

**Note:** This widget is marked with `// ignore: must_be_immutable` and contains mutable fields, which is not a recommended practice in Flutter. State should be managed by the `State` object.

---

### `_SelectableContainerState`

The state management class for `SelectableContainer`. It handles the state changes when the container is tapped.

**Logic:**

- When the `FoodContainer` is tapped, `setState` is called.
- It toggles the `isSelected` boolean on its `widget` instance (`SelectableContainer`).
- It then invokes the `onContainerClick` callback, passing the `widget.price` and the new `widget.isSelected` value.

---

### `FoodContainer`

A stateless widget responsible for rendering the UI of the food item container. It is used internally by `SelectableContainer` to display the visual elements.

**Properties:**

| Name | Type | Description |
| --- | --- | --- |
| `widget` | `SelectableContainer` | An instance of `SelectableContainer` containing the data to display and its state. |
| `onClick` | `Function` | The function to execute when the `GestureDetector` detects a tap. |

**UI Details:**

- It uses a `GestureDetector` to capture tap events.
- The `Container`'s background color changes to a light purple (`Color.fromARGB(255, 246, 238, 254)`) when `isSelected` is true, and transparent otherwise.
- It displays the food image using `Image.asset` inside a `Container`.
- It displays the `foodName` and `price` in `Text` widgets with bold styling.

**Usage Example:**

```dart
SelectableContainer(
  foodName: 'Pizza',
  foodImageUrl: 'assets/images/pizza.png',
  price: 250.0,
  onContainerClick: (price, isSelected) {
    print('Item price: $price, is selected: $isSelected');
  },
)
```

## File: `lib/food.dart`

This file contains the `Food` class, which is a data model for a food item.

---

### `Food`

A simple class that represents a food item.

**Properties:**

| Name | Type | Description |
| :--- | :--- | :--- |
| `foodName` | `String` | The name of the food. |
| `price` | `double` | The price of the food. |
| `imageUrl` | `String` | The asset path for the food's image. Has a default value. |

---

## File: `lib/menu_select.dart`

This file contains the `MenuSelectScreen` widget, which displays a categorized menu where users can select items and see a running total of their bill.

---

### `MenuSelectScreen`

A stateful widget that displays a menu of food items categorized into sections like "Main Dishes", "Side Dishes", etc. Users can select items, and the screen keeps track of the total price.

**Properties:**

| Name | Type | Description |
| :--- | :--- | :--- |
| `title` | `String` | The title to be displayed in the app bar. |

---

### `_MenuSelectScreenState`

The state class for `MenuSelectScreen`. It manages the menu data, user selections, and the total price calculation.

**State Properties:**

| Name | Type | Description |
| :--- | :--- | :--- |
| `totalPrice` | `double` | Stores the cumulative price of all selected food items. Initialized to `0`. |
| `mainDishes`, `sideDishes`, etc. | `List<Food>` | Hardcoded lists of `Food` objects representing the items in each menu category. |
| `...Color` | `Color` | Color constants used for the background of each food category section. |

**Methods:**

- **`build(BuildContext context)`**: Constructs the main UI of the screen. It uses a `Scaffold` with an `AppBar`, a `ListView` to display the food categories, and a `FloatingActionButton` to show the total bill.

- **`foodDisplayContainer(...)`**: A helper method that returns a `Container` widget for a specific food category. It displays a title and a `GridView` of `SelectableContainer` widgets.

- **`buildContainers(...)`**: A helper method that takes a list of `Food` objects and generates a list of `SelectableContainer` widgets to be used within the `GridView`.

- **`openDialoge()`**: Displays an `AlertDialog` showing the final `totalPrice`.

- **`onContainerClick(double price, bool isSelected)`**: The callback function passed to each `SelectableContainer`. It updates the `totalPrice` by adding or subtracting the item's price.
  **Bug:** This method modifies `totalPrice` but **does not call `setState()`**. As a result, the UI will not update to reflect the new total when the dialog is shown. The price calculation logic should be wrapped in a `setState` call.

**Usage Example:**

This screen is typically called by the main function in the app.

## File: `lib/main.dart`
This file is responsible for setting up the main application theme and navigation. 

For this practice, it calls the `MenuSelectScreen` widget from the `lib/menu_select.dart` file.
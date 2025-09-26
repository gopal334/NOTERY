// free.dart//
class FreeItem {
  final String name;
  final String description;

  FreeItem({required this.name, required this.description});
}

class FreeItemsManager {
  List<FreeItem> _items = [];

  // Add a free item
  void addItem(FreeItem item) {
    _items.add(item);
  }

  // Get all free items
  List<FreeItem> getItems() {
    return _items;
  }

  // Print all free items
  void printItems() {
    if (_items.isEmpty) {
      print("No free items available.");
    } else {
      print("Free Items List:");
      for (var item in _items) {
        print("- ${item.name}: ${item.description}");
      }
    }
  }
}



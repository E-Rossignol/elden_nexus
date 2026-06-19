import '../constants/constant.dart';

/// Base model for in-game items.
///
/// @param name Item name.
/// @param cat ItemCategory enum value.
/// @param image Image path or URL.
class Item {
  late final String name;
  late final ItemCategory cat;
  late final String image;

  /// Create an Item base instance.
  Item({required this.name, required this.cat, required this.image});
}

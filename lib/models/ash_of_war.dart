import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

class AshOfWar extends Item {
  late String howToFind;
  late String description;
  late String mapLink;
  AshOfWar({
    required super.name,
    required super.image,
    required this.howToFind,
    required this.description,
    required this.mapLink,
  }) : super(
          cat: ItemCategory.ashOfWar, // Set the category directly here
        );
}

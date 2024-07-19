import '../constants/constant.dart';

class Item {
  late final String name;
  late final ItemCategory cat;
  late final String image;
  late final ObtentionWay way;
  Item({
    required this.name,
    required this.cat,
    required this.image,
  });
}

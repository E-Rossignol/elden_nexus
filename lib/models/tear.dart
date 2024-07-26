import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

class Tear extends Item {
  late String mapLink;
  late double duration;
  late String howToFind;
  late String effect;

  Tear({
    required super.name,
    required super.image,
    required this.howToFind,
    required this.mapLink,
    required this.duration,
    required this.effect,
  }) : super(
    cat: ItemCategory.tear, // Set the category directly here
  );

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'image': image,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'duration': duration,
      'effect': effect,
    };
  }

  static Tear fromMap(Map<String, dynamic>? data) {
    return Tear(
      name: data?['name'],
      image: data?['image'],
      howToFind: data?['howToFind'],
      mapLink: data?['mapLink'],
      duration: data?['duration'],
      effect: data?['effect'],
    );
  }
}

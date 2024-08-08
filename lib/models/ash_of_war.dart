import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

class AshOfWar extends Item {
  late String howToFind;
  late String description;
  late String mapLink;
  late String affinity;
  late String usableOn;
  AshOfWar({
    required super.name,
    required super.image,
    required this.howToFind,
    required this.description,
    required this.mapLink,
    required this.affinity,
    required this.usableOn,
  }) : super(
          cat: ItemCategory.ashOfWar, // Set the category directly here
        );

  static AshOfWar fromMap(Map<String, dynamic>? data) {
    return AshOfWar(
      name: data!['name'],
      image: data['image'],
      howToFind: data['howToFind'],
      description: data['description'],
      mapLink: data['mapLink'],
      affinity: data['affinity'],
      usableOn: data['usableOn'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'howToFind': howToFind,
      'description': description,
      'mapLink': mapLink,
      'affinity': affinity,
      'usableOn': usableOn,
    };
  }

  String toStr(){
    return 'AshOfWar(name: "$name", image: "$image", howToFind: "$howToFind", description: "$description", mapLink: "$mapLink", affinity: "", usableOn: ""),';
  }
}

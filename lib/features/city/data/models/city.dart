import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class City extends Equatable {
  final String name;
  final String location;
  final String image;

  // id is the document id
  String? id;

  City({
    required this.name,
    required this.location,
    required this.image,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      name: map['name'],
      image: map['image'],
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'location': location,
    };
  }

  @override
  List<Object?> get props => [
        name,
        image,
        location,
      ];
}

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  final String userId;
  final String cityName;

  // id is the document id
  String? id;

  UserModel({
    required this.cityName,
    required this.userId,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      cityName: map['cityName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'cityName': cityName,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        cityName,
      ];
}

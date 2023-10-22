import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firestore_db.dart';
import '../models/city.dart';

class CityRepository {
  final FirestoreDatabase _db = FirestoreDatabase();
  Future<List<City>> fetchCities() async {
    QuerySnapshot<Object?> citiesCollection = await _db.getCollection(
      "cities",
    );

    List<City> cities = citiesCollection.docs
        .map(
          (e) => City.fromMap(e.data() as Map<String, dynamic>)..id = e.id,
        )
        .toList();

    return cities;
  }
}

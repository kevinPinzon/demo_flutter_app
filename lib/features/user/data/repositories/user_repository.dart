import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firestore_db.dart';

import '../models/user.dart';

class UserRepository {
  final FirestoreDatabase _db = FirestoreDatabase();

  Future<void> addUser(
    String cityName,
    String userId,
  ) async {
    final User user = User(cityName: cityName, userId: userId);
    await _db.addDocument(
      "users",
      user.toMap(),
    );
  }

  Future<User?> fetchUsers(String userId) async {
    User? user;
    final DocumentSnapshot? document = await _db.getDocumentWithQuery(
      "users",
      "userId",
      userId,
    );
    if (document != null) {
      user = User.fromMap(document.data() as Map<String, dynamic>);
      return user;
    } else{
      return user;
    }
  }

  Future<User?> fetchUser(String userId) async {
    final DocumentSnapshot? snapshot = await _db.getDocumentWithQuery("users", "userId", userId);

    if (snapshot != null && snapshot.exists) {
      return User.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

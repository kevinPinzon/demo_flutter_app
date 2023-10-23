import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firestore_db.dart';

import '../models/user.dart';

class UserRepository {
  final FirestoreDatabase _db = FirestoreDatabase();

  Future<void> addUser(
    String cityName,
    String userId,
  ) async {
    final UserModel user = UserModel(cityName: cityName, userId: userId);
    await _db.addDocument(
      "users",
      user.toMap(),
    );
  }

  Future<UserModel?> fetchUsers(String userId) async {
    UserModel? user;
    final DocumentSnapshot? document = await _db.getDocumentWithQuery(
      "users",
      "userId",
      userId,
    );
    if (document != null) {
      user = UserModel.fromMap(document.data() as Map<String, dynamic>);
      return user;
    } else{
      return user;
    }
  }

  Future<UserModel?> fetchUser(String userId) async {
    final DocumentSnapshot? snapshot = await _db.getDocumentWithQuery("users", "userId", userId);

    if (snapshot != null && snapshot.exists) {
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

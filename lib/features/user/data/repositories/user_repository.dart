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

  Future<List<User>> fetchUsers(String clientId) async {
    final QuerySnapshot snapshot = await _db.getDocumentsWithQuery(
      "users",
      "userId",
      clientId,
    );
    return snapshot.docs
        .map(
          (QueryDocumentSnapshot doc) => User.fromMap(
            doc.data() as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
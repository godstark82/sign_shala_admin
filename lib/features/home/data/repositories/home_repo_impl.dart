import 'package:admin_sign_shala/core/datastate/datastate.dart';
import 'package:admin_sign_shala/features/home/domain/repositories/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepoImpl implements HomeRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<DataState<int>> getTotalStudentsCount() async {
    try {
      final query = await firestore.collection('users').get();
      final users = query.docs.length;
      return DataSuccess(users);
    } catch (e) {
      return DataError(e.toString());
    }
  }

  //!
  @override
  Future<DataState<int>> getTotalCoursesCount() async {
    try {
      final query = await firestore.collection('courses').get();
      final users = query.docs.length;
      return DataSuccess(users);
    } catch (e) {
      return DataError(e.toString());
    }
  }
}

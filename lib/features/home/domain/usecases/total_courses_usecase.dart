import 'package:admin_sign_shala/core/datastate/datastate.dart';
import 'package:admin_sign_shala/core/usecase/usecase.dart';
import 'package:admin_sign_shala/features/home/domain/repositories/home_repo.dart';

class TotalCoursesUsecase extends UseCase<DataState<int>, void> {
  final HomeRepository repo;
  TotalCoursesUsecase(this.repo);
  @override
  Future<DataState<int>> call(void params) async {
    return (await repo.getTotalCoursesCount());
  }
}

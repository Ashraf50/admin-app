import 'package:admin_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../model/manager_model/manager_model.dart';

abstract class ManagerRepo {
  Future<Either<Failure, List<ManagerModel>>> fetchAllManagers();

  Future<Either<Failure, List<ManagerModel>>> searchManager(
      {required String name});
  Future<Either<Failure, Unit>> deleteManager(int id);
  Future<Either<Failure, Unit>> editManager({
    required int id,
    required String name,
  });
  Future<Either<Failure, Unit>> createManager({required String name});
}

import 'package:admin_app/features/add_manager/data/model/manager_model/manager_model.dart';
import 'package:admin_app/features/add_manager/data/repo/manager_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_manager_state.dart';

class AddManagerCubit extends Cubit<AddManagerState> {
  ManagerRepo managerRepo;
  AddManagerCubit(this.managerRepo) : super(AddManagerInitial());

  Future<void> fetchManager() async {
    emit(FetchManagerLoading());
    var result = await managerRepo.fetchAllManagers();
    result.fold(
      (failure) {
        emit(
          FetchManagerFailure(errMessage: failure.errMessage),
        );
      },
      (managers) {
        emit(
          FetchManagerSuccess(managers: managers),
        );
      },
    );
  }

  Future<void> searchManager(String name) async {
    emit(FetchManagerLoading());
    var result = await managerRepo.searchManager(name: name);
    result.fold(
      (failure) {
        emit(FetchManagerFailure(errMessage: failure.errMessage));
      },
      (managers) {
        emit(FetchManagerSuccess(managers: managers));
      },
    );
  }

  Future<void> deleteManager(int id) async {
    emit(FetchManagerLoading());
    var result = await managerRepo.deleteManager(id);
    result.fold(
      (failure) {
        emit(FetchManagerFailure(errMessage: failure.errMessage));
      },
      (_) async {
        await fetchManager();
      },
    );
  }
}

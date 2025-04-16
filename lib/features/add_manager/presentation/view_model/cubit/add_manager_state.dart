part of 'add_manager_cubit.dart';

sealed class AddManagerState {}

final class AddManagerInitial extends AddManagerState {}

final class FetchManagerLoading extends AddManagerState {}

final class FetchManagerSuccess extends AddManagerState {
  final List<ManagerModel> managers;
  FetchManagerSuccess({required this.managers});
}

final class FetchManagerFailure extends AddManagerState {
  final String errMessage;
  FetchManagerFailure({required this.errMessage});
}

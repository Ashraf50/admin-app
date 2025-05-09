import 'package:admin_app/features/Auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          final result = await authRepo.login(
            email: event.email,
            password: event.password,
          );
          if (result['type'] == 'error') {
            emit(LoginFailure(errMessage: result['message']));
          } else if (result['type'] == 'success') {
            final user = result['data']['user'];
            if (user == null || user['type'] != 0) {
              emit(LoginFailure(errMessage: "This account is not an admin."));
              return;
            }
            final token = result['data']['token'];
            final refreshToken = result['data']['refresh_token'];
            emit(LoginSuccess(successMessage: result['message'], token: token));
            const FlutterSecureStorage secureStorage = FlutterSecureStorage();
            await secureStorage.write(key: 'auth_token', value: token);
            await secureStorage.write(
                key: 'refresh_token', value: refreshToken);
          }
        } catch (e) {
          emit(LoginFailure(errMessage: e.toString()));
        }
      } else if (event is ForgetPassEvent) {
        emit(ForgetLoading());
        try {
          final result = await authRepo.forgetPassword(email: event.email);
          if (result['type'] == 'error') {
            final errorDetails = result['data'];
            String errorMessage = result['message'];
            if (errorDetails is Map && errorDetails.containsKey('user')) {
              errorMessage = errorDetails['user'];
            }
            emit(ForgetFailure(errMessage: errorMessage));
          } else if (result['type'] == 'success') {
            final user = result['data']['user'];
            if (user == null || user['type'] != 0) {
              emit(ForgetFailure(errMessage: "This account is not an admin."));
              return;
            }
            emit(ForgetSuccess(successMessage: result['message']));
          }
        } catch (e) {
          emit(ForgetFailure(errMessage: e.toString()));
        }
      } else if (event is ResetPassEvent) {
        emit(ResetLoading());
        try {
          final result = await authRepo.resetPassword(
            email: event.email,
            code: event.code,
            password: event.password,
            passwordConfirm: event.passwordConfirm,
          );
          if (result['type'] == 'error') {
            emit(ResetFailure(errMessage: result['message']));
          } else if (result['type'] == 'success') {
            final user = result['data']['user'];
            if (user == null || user['type'] != 0) {
              emit(ResetFailure(errMessage: "This account is not an admin."));
              return;
            }
            emit(ResetSuccess(successMessage: result['message']));
          }
        } catch (e) {
          emit(ResetFailure(errMessage: e.toString()));
        }
      } else if (event is VerifyCodeEvent) {
        emit(VerifyCodeLoading());
        try {
          final result = await authRepo.verifyCode(
            email: event.email,
            code: event.code,
          );
          if (result['type'] == 'error') {
            final errorDetails = result['data'];
            String errorMessage = result['message'];
            if (errorDetails is Map && errorDetails.containsKey('code')) {
              errorMessage = errorDetails['code'];
            }
            emit(VerifyCodeFailure(errMessage: errorMessage));
          } else if (result['type'] == 'success') {
            final user = result['data']['user'];
            if (user == null || user['type'] != 0) {
              emit(VerifyCodeFailure(
                  errMessage: "This account is not an admin."));
              return;
            }
            emit(VerifyCodeSuccess(successMessage: result['message']));
          }
        } catch (e) {
          emit(VerifyCodeFailure(errMessage: e.toString()));
        }
      }
    });
  }
}

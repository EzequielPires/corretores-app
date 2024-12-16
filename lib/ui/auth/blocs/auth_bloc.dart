import 'package:app/domain/models/auth_response.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:app/ui/auth/blocs/auth_event.dart';
import 'package:app/ui/auth/blocs/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<AuthSignin>(_authSignin);
    on<AuthLogout>(_authLogout);
    on<AuthLoad>(_authLoadUser);
  }

  Future<void> _authSignin(
    AuthSignin event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      AuthResponse response = await authRepository.signin(
        event.email,
        event.password,
      );

      emit(
        Authenticated(user: response.user, token: response.token),
      );
    } catch (e) {
      print('error $e');
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> _authLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    await authRepository.signout();
    emit(Unauthenticated());
  }

  Future<void> _authLoadUser(
    AuthLoad event,
    Emitter<AuthState> emit,
  ) async {
    AuthResponse? response = await authRepository.load();

    if (response != null) {
      emit(Authenticated(
        user: response.user,
        token: response.token,
      ));
    } else {
      emit(Unauthenticated());
    }
  }
}

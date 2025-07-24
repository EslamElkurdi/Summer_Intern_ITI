import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/tasks_cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static final AuthCubit _instance = AuthCubit._internal();
  factory AuthCubit() => _instance;
  AuthCubit._internal() : super(AuthIntial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    emit(AuthLoading());

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  User? get currentUser => _auth.currentUser;

  void logout() async {
    await _auth.signOut();
    emit(AuthIntial());
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interceptors/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptors/services/locator.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final locator = getIt.get<SharedPreferenceHelper>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
  }
}

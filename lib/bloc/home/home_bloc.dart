import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interceptors/data/repository/home_repository.dart';
import 'package:interceptors/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptors/model/user.dart';
import 'package:interceptors/services/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadUserEvent>(_loadUser);
  }

  FutureOr<void> _loadUser(LoadUserEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      final users = await homeRepository.getAllUsers();
      emit(HomeLoaded(users: users));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}

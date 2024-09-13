import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/features/home/models/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<User> userList = [
    User(name: 'facundo'),
    User(name: 'elias'),
    User(name: 'tomas'),
  ];

  HomeBloc() : super(HomeInitial()) {
    on<GetItemsList>(_getUser);
  }

  Future<void> _getUser(GetItemsList event, Emitter<HomeState> emit) async {
    emit(LoadingHome());
    await Future.delayed(const Duration(seconds: 2));
    emit(ItemsUser(listUser: userList));
  }
}

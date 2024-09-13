part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingHome extends HomeState {}

class ItemsUser extends HomeState {
  final List<User> listUser;

  ItemsUser({required this.listUser});
}

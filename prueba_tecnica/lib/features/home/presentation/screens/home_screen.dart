import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/features/home/models/user.dart';
import 'package:prueba_tecnica/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> listUser = [];
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocConsumer(
          bloc: bloc,
          listener: (context, state) {
            if (state is ItemsUser) {
              listUser = state.listUser;
            }
            setState(() {});
          },
          builder: (context, state) {
            if (state is LoadingHome) return const CircularProgressIndicator();
            return ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                User user = listUser[index];
                Text(user.name);
              },
            );
          },
        ),
      ),
    );
  }
}

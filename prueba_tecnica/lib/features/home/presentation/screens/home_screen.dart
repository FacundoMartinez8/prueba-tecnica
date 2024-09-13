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
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(GetItemsList());
  }

  List<User> listUser = [];
  @override
  Widget build(BuildContext context) {
    //final bloc = BlocProvider.of<HomeBloc>(context);
    //bloc.add(GetItemsList());
    return Scaffold(
      body: Center(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ItemsUser) {
              listUser = state.listUser;
            }
            setState(() {});
          },
          builder: (context, state) {
            if (state is LoadingHome) return const CircularProgressIndicator();
            return Center(
              child: SizedBox(
                width: 400,
                height: 200,
                child: ListView.builder(
                  itemCount: listUser.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    User user = listUser[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

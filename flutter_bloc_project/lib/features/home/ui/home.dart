import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      // listenWhen: (context, state) {},
      listener: (context, state) {},
      // buildWhen: (previous, current) {

      // },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Grocery App",
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        );
      },
    );
  }
}

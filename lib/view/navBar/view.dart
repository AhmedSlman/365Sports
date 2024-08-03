import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/view/navBar/components/nav_bar.dart';
import 'package:sportat/view/navBar/cubit.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit()..getHomeData(),
      child: const NavBar(),
    );
  }
}

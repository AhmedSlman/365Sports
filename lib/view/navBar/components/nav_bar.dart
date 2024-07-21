import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/view/addVideo/view.dart';
import 'package:sportat/view/navBar/components/nav_bar_item.dart';
import 'package:sportat/view/navBar/cubit.dart';
import 'package:sportat/view/navBar/widgets/floating_action_child.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = NavBarCubit.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.getCurrentView,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:AppStorage.isGuestLogged?const Text(""): FloatingActionButton(
          child: const FloatingActionChild(),
          onPressed: () {
            addVideoForm(context);
          },
        ),
        bottomNavigationBar:    BottomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NavBarItem(),
          ),
          notchMargin: 8.0,
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}

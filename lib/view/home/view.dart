import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/view/home/component/app_bar.dart';
import 'package:sportat/view/home/component/video_card.dart';
import 'package:sportat/view/home/controller.dart';
import 'package:sportat/view/home/states.dart';
import 'package:sportat/widgets/loading_indicator.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomeController()..init(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor:const Color.fromRGBO(241, 241, 241, 1) ,
          body: BlocBuilder<HomeController,HomeStates>(
            builder:(BuildContext context,state)=>state is HomeLoading?const LoadingIndicator() :RefreshIndicator(
              onRefresh: HomeController.of(context).init,
              child: SingleChildScrollView(
                child: Container(
                  margin:  const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children:  [
                      const HomeAppBar(),
                      HomeVideoCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

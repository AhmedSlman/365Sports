
// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/home_model.dart';
import 'package:sportat/view/home/view.dart';
import 'package:sportat/view/notification/view.dart';
import 'package:sportat/view/profile/view.dart';
import 'package:sportat/view/search/view.dart';
import 'states.dart';

class NavBarCubit extends Cubit<NavBarStates>{
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<String> info=[];



  List<Widget> content = [
    const HomeView(),
    const SearchView(),
    const NotificationView(),
    ProfileView(
      id: 0,
      isSearch: false,
    ),

  ];

  void changeIndex(int value){
    if(isCurrentIndex(value)) return;
    currentIndex = value;
    emit(NavBarInit());
  }

  bool isCurrentIndex(int value)=> value == currentIndex;

  Widget get getCurrentView => content[currentIndex];


  //get home
  HomeModel? homeModel;
  Future<void> getHomeData()async{
    emit(NavBarLoading());
    try{
      final response=await DioHelper.get(
          "${AppStorage.isGuestLogged ? 'guest/' : ''}home");
      final data =response!.data as Map <String,dynamic>;
      homeModel=HomeModel.fromJson(data);
    }catch(e,s){
      print(s);
      print(e);
      showDefaultError();
    }
    emit(NavBarInit());
  }

   Future<void> init() async {
     emit(NavBarLoading());
     await getHomeData();
     emit(NavBarInit());
  }


}
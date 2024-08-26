import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/home_model.dart';
import 'package:sportat/view/home/view.dart';
import 'package:sportat/view/navBar/states.dart';
import 'package:sportat/view/notification/view.dart';
import 'package:sportat/view/profile/view.dart';
import 'package:sportat/view/search/view.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> content = [
    const HomeView(),
    const SearchView(),
    const NotificationView(),
    ProfileView(
      id: 0,
      isSearch: false,
    ),
  ];

  void changeIndex(int value) {
    if (isCurrentIndex(value)) return;
    currentIndex = value;
    emit(NavBarIndexChanged(currentIndex));
  }

  bool isCurrentIndex(int value) => value == currentIndex;

  Widget get getCurrentView => content[currentIndex];

  HomeModel? homeModel;

  Future<void> getHomeData() async {
    emit(NavBarLoading());
    try {
      final response = await DioHelper.get(
        "${AppStorage.isGuestLogged ? 'guest/' : ''}home",
      );
      final data = response?.data as Map<String, dynamic>;
      // ignore: unnecessary_null_comparison
      if (data != null) {
        homeModel = HomeModel.fromJson(data);
        emit(NavBarHomeDataLoaded(homeModel));
      } else {
        emit(NavBarError("No data received"));
      }
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('Stack trace: $s');
      showDefaultError();
      emit(NavBarError(e.toString()));
    }
  }

  Future<void> init() async {
    await getHomeData();
  }
}

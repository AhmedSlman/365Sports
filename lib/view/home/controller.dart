import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/check_model.dart';
import 'package:sportat/core/models/home_model.dart';
import 'package:sportat/view/home/states.dart';

List? categories = [];

class HomeController extends Cubit<HomeStates> {
  HomeController() : super(HomeInit());

  static HomeController of(context) => BlocProvider.of(context);
  String? competitionRules = '';
  List<Datu> homeVideos = [];
  HomeModel? homeModel;
  CheckModel? checkModel;

  ScrollController scrollController = ScrollController();
  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final response = await DioHelper.get("list-categories");

      // final response2 = await DioHelper.get("competition_rules");
      final response3 = await DioHelper.get("home");

      final data = response!.data as Map<String, dynamic>;
      //  final data2 = response2!.data as Map<String, dynamic>;
      final data3 = response3!.data as Map<String, dynamic>;

      homeModel = HomeModel.fromJson(data3);
      print(response3);
      // competitionRules = data2['data']['value'];

      categories!.clear();
      homeVideos.clear();
      categories!.addAll(data['data']['data']);
      homeVideos.addAll(homeModel!.data!);
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
      showDefaultError();
    }
    emit(HomeLoading());
  }

  Future<void> getLive() async {
    final response = await DioHelper.get('check-pin-code');
    final data = response!.data as Map<String, dynamic>;
    checkModel = CheckModel.fromJson(data);
    emit(HomeInit());
  }

  Future<void> init() async {
    emit(HomeLoading());
    await getHomeData();
    await getLive();
    await pagination(page);
    emit(HomeInit());
  }

  Future<List<Datu>?> pagination(int page) async {
    for (int i = 2; i < homeModel!.data!.length; i++) {
      try {
        final response = await DioHelper.get(
            "${AppStorage.isGuestLogged ? 'guest/' : ''}home?page=$i");
        final data = response!.data as Map<String, dynamic>;
        final homeModel = HomeModel.fromJson(data);
        homeVideos.addAll(homeModel.data!);
      } catch (e) {
        showDefaultError();
      }
    }
    return null;
  }

  int page = 1;

  void loadVideos() {
    if (state is VideosLoading) return;
    final currentState = state;
    var oldVideos = <Datu>[];
    if (currentState is VideosLoaded) {
      oldVideos = currentState.videos;
    }
    emit(VideosLoading(oldVideos, isFirstFetch: page == 1));
    pagination(page).then((value) {
      page++;
      final videos = (state as VideosLoading).oldVideos;
      videos.addAll(value!);
      if (kDebugMode) {
        print('page number$page');
      }
      emit(VideosLoaded(videos));
    });
  }
}

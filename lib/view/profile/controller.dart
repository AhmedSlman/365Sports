// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/personal_info.dart';
import 'package:sportat/core/models/profile_model.dart';
import 'package:sportat/view/profile/states.dart';

class ProfileController extends Cubit<ProfileStates> {
  ProfileController({this.id, this.isSearch = false}) : super(ProfileInit());

  static ProfileController of(context) => BlocProvider.of(context);

  ProfileModel? profileModel;
  PersonalInfoModel? personalInfoModel;
  final int? id;
  final bool isSearch;

  List<Video> videos = [];
  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final response = await DioHelper.get(
          isSearch == false ? 'get-profile' : 'get-profile-by-id/$id');
      final data = response?.data as Map<String, dynamic>;
      print(data);
      print(response);
      profileModel = ProfileModel.fromJson(data);
      if (profileModel!.data!.videos.isNotEmpty) {
        videos.addAll(profileModel!.data!.videos);
      }
      print(videos);
    } catch (e, s) {
      showDefaultError();
      print(e);
      print(s);
    }
    emit(ProfileInit());
  }

  Future<void> getData() async {
    emit(ProfileLoading());
    await getProfile();
    isSearch == true ? null : await getPersonalInfo();
    emit(ProfileInit());
  }

  Future<void> getPersonalInfo() async {
    emit(ProfileLoading());
    try {
      final response = await DioHelper.get('personal-information');
      personalInfoModel = PersonalInfoModel.fromJson(response?.data);
      AppStorage.cacheUserImage(personalInfoModel!.data!.user!.profileImage);
    } catch (e) {
      showDefaultError();
    }
    emit(ProfileInit());
  }
}

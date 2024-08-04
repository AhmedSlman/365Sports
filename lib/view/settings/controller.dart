import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/country.dart';
import 'package:sportat/core/models/personal_info.dart';
import 'package:sportat/view/settings/states.dart';
import 'package:sportat/widgets/snack_bar.dart';
import 'package:sportat/core/models/user_model.dart';

class SettingsController extends Cubit<SettingsStates> {
  SettingsController(this.personalInfoModel) : super(SettingsInit()) {
    if (personalInfoModel?.data != null) {
      final info = personalInfoModel?.data;
      firstName = TextEditingController(text: info!.user!.firstName);
      lastName = TextEditingController(text: info.user?.lastName);
      email = TextEditingController(text: info.user?.email);
      phone = TextEditingController(text: info.user?.phone);
      dateOfBirth = TextEditingController(text: info.user?.dOB);
      bio = TextEditingController(text: info.user?.bio);
    }
    emit(SettingsInit());
  }

  static SettingsController of(context) => BlocProvider.of(context);
  late final PersonalInfoModel? personalInfoModel;
  late UserModel registerOneModel;
  CountryModel? countryModel;
  List<String>? countries = [];
  TextEditingController country = TextEditingController();

  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController bio = TextEditingController();

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  File? image;
  File? cover;

  final formKey = GlobalKey<FormState>();

  Future<void> getPersonalInfo() async {
    emit(SettingsLoading());
    try {
      final response = await DioHelper.get('personal-information');
      personalInfoModel = PersonalInfoModel.fromJson(response?.data);
    } catch (e) {
      showDefaultError();
    }
    emit(SettingsInit());
  }

  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(EditSettingsLoading());
    final body = {
      'first_name': firstName.text,
      'last_name': lastName.text,
      'country_id': '45',
      'email': email.text,
      'phone': phone.text,
      'd_o_b': dateOfBirth.text,
      'bio': bio.text,
    };
    FormData formData = FormData.fromMap(body);
    if (image != null) {
      formData.files.add(
          MapEntry('profile_image', await MultipartFile.fromFile(image!.path)));
    }
    if (cover != null) {
      formData.files
          .add(MapEntry('cover', await MultipartFile.fromFile(cover!.path)));
    }
    try {
      final response =
          await DioHelper.post('update-profile', true, formData: formData);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1) {
        UserModel registerOneModel = UserModel.fromJson(data);
        await AppStorage.cacheRegisterOneInfo(registerOneModel);
        showSnackBar(data['massage']);
      } else {
        showSnackBar(data['massage']);
      }
    } catch (e, s) {
      showDefaultError();
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }
    emit(SettingsInit());
  }

  Future<void> editProfilePicture() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    image = File(pickedImage.path);
    emit(SettingsInit());
  }

  Future<void> editCover() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    cover = File(pickedImage.path);
    emit(SettingsInit());
  }
}

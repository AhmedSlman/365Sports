// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/user_model.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/login/states.dart';
import 'package:sportat/view/navBar/view.dart';
import 'package:sportat/widgets/snack_bar.dart';

class LoginController extends Cubit<LoginStates> {
  LoginController() : super(LoginInit());

  static LoginController of(context) => BlocProvider.of(context);

  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController token = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    // final token = AppStorage.getToken;
    final token = await FirebaseMessaging.instance.getToken();
    emit(LoginLoading());
    final body = {
      'phone': phone.text,
      'password': password.text,
      'token': token,
      'serial_number': '10',
      'os': Platform.isAndroid ? 'android' : 'ios'
    };
    try {
      final response = await DioHelper.post('login', false, body: body);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1) {
        UserModel userModel = UserModel?.fromJson(data);
        await AppStorage.cacheRegisterOneInfo(userModel);
        AppStorage.isLogged
            ? MagicRouter.navigateAndPopAll(const NavBarView())
            : MagicRouter.navigateAndPopAll(const NavBarView());

        // MagicRouter.navigateTo(PinCodeView(
        //     email: null,
        //     phone: phone.text,
        //     isForget: false,
        //     isGuest: false,
        //   ));
        showSnackBar(data['massage']);
      } else {
        showSnackBar(data['massage']);
      }
    } catch (e, s) {
      showDefaultError();
      print(e);
      print(s);
    }
    emit(LoginInit());
  }

  Future<void> signInWithFacebook() async {}
}

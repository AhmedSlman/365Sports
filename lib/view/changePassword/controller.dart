import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/changePassword/states.dart';
import 'package:sportat/widgets/snack_bar.dart';

class ChangePasswordController extends Cubit<ChangePasswordStates> {
  ChangePasswordController() : super(ChangePasswordInit());

  static ChangePasswordController of(context) => BlocProvider.of(context);

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(ChangePasswordLoading());
    final body = {
      'oldpassword': oldPassword.text,
      'newpassword': newPassword.text,
      'newpassword_confirmation': confirmNewPassword.text
    };
    try {
      final response =
          await DioHelper.post('change-password', true, body: body);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1) {
        MagicRouter.pop();
        showSnackBar(data['massage']);
      }
      MagicRouter.pop();
      showSnackBar(data['massage']);
    } catch (e) {
      showDefaultError();
      if (kDebugMode) {
        print(e);
      }
    }
    emit(ChangePasswordInit());
  }
}

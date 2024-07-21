import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/login/view.dart';
import 'package:sportat/view/resetPassword/states.dart';
import 'package:sportat/widgets/snack_bar.dart';

class ResetPasswordController extends Cubit<ResetPasswordStates> {
  ResetPasswordController(this.phone,this.code) : super(ResetPasswordInit());

  static ResetPasswordController of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  TextEditingController code;
  final String phone;

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(ResetPasswordLoading());
    final body = {
      'phone': phone,
      'pin_code': code.text,
      'password': newPassword.text,
      'password_confirmation': confirmNewPassword.text,
    };
    try {
      final response = await DioHelper.post('new-password', false, body: body);
      final data = response.data as Map;
      if (data['status'] == 1) {
        showSnackBar(data['massage']);
        MagicRouter.navigateTo(const LoginView());
      }else{
        showSnackBar(data['massage']);
      }
    } catch (e) {
      showDefaultError();
    }
    emit(ResetPasswordInit());
  }
}

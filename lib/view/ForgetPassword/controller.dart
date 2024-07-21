import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/ForgetPassword/states.dart';
import 'package:sportat/view/pinCode/view.dart';
import 'package:sportat/widgets/snack_bar.dart';

class ForgetPasswordController extends Cubit<ForgetPasswordStates> {
  ForgetPasswordController() : super(ForgetPasswordInit());

  static ForgetPasswordController of(context) => BlocProvider.of(context);

  String? phone;
  final formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(ForgetPasswordLoading());
    final body = {
      'phone': phone,
    };
    try {
      final response =
          await DioHelper.post('reset-password', false, body: body);
      final data = response.data as Map;
      if (data['status'] == 1) {
        showSnackBar(data['massage']);
        MagicRouter.navigateTo(
          PinCodeView(
            phone: phone,
            isForget: true,
            email: null,
            isGuest: false,
          ),
        );
      } else {
        showSnackBar(data['massage']);
      }
    } catch (e) {
      showDefaultError();
      print(e);
    }
    emit(ForgetPasswordInit());
  }
}

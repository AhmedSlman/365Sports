import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/completeSignup/view.dart';
import 'package:sportat/view/navBar/view.dart';
import 'package:sportat/view/pinCode/component/success_verification_dialog.dart';
import 'package:sportat/view/pinCode/states.dart';
import 'package:sportat/view/resetPassword/view.dart';
import 'package:sportat/widgets/snack_bar.dart';

class PinCodeController extends Cubit<PinCodeStates> {
  PinCodeController(this.email, this.phone, this.isForget, this.isGuest,
      this.isCheck, this.item)
      : super(PinCodeInit());

  static PinCodeController of(context) => BlocProvider.of(context);

  String? phone;
  String? item;
  final String? email;

  TextEditingController code = TextEditingController();
  bool isForget;
  bool isGuest;
  final bool? isCheck;

  final formKey = GlobalKey<FormState>();

  Future<void> checkPinCode() async {
    final body = {
      'phone': '$item$phone',
      'verification_code': code.text,
    };
    final guestBody = {
      'email': email,
      'pin_code': code.text,
    };
    emit(PinCodeLoading());
    try {
      final response = await DioHelper.post(
          '${phone == null ? 'guest/' : ''}check-pin-code', false,
          body: email != null ? guestBody : body);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1) {
        await showSuccessVerification();
        isGuest == true;
        isForget
            ? MagicRouter.navigateTo(
                ResetPasswordView(
                  code: code,
                  phone: phone,
                ),
              )
            : phone != null
                ? MagicRouter.navigateTo(
                    CompleteSignupView(
                      phone: phone,
                      item: item,
                    ),
                  )
                : MagicRouter.navigateTo(
                    const NavBarView(),
                  );
        isGuest == true;
        showSnackBar(data['massage']);
      } else {
        showSnackBar(data['massage']);
      }
    } catch (e) {
      showDefaultError();
    }
    emit(PinCodeInit());
  }

  Future<void> resendCode() async {
    final body = {
      'phone': phone,
    };
    final response = await DioHelper.post('resend', true, body: body);
    final data = response.data as Map;
    if (data['status'] == 1) {
      showSnackBar(data['massage']);
    } else {
      showSnackBar(data['massage']);
    }
    emit(PinCodeInit());
  }
}

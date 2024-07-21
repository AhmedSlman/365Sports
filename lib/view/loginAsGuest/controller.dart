
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/loginAsGuest/states.dart';
import 'package:sportat/view/navBar/view.dart';
import 'package:sportat/view/pinCode/view.dart';
import 'package:sportat/widgets/snack_bar.dart';

class LoginAsGuestController extends Cubit<LoginGuestStates>{
  LoginAsGuestController() : super(LoginGuestInit());

  static LoginAsGuestController of(context)=>BlocProvider.of(context);
  TextEditingController email=TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login()async{
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(LoginGuestLoading());
    final body = {
      'email': email.text,
    };
    try {
      final response = await DioHelper.post('guest/login', false, body: body);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1 && data['massage'] == 'dn') {
        await AppStorage.cacheGuestToken(data['data']['token']);

        MagicRouter.navigateAndPopAll(const NavBarView());
      } else if (data['data']['user']['is_active'] ==0) {
        MagicRouter.navigateAndPopAll(PinCodeView(
          email: email.text,
          phone: null,
          isForget: false,
          isGuest: true,
        ));
        await AppStorage.cacheGuestToken(data['data']['token']);
      }

      showSnackBar(data["massage"]);
    } catch (e, s) {
      showDefaultError();
      print(e);
      print(s);
    }
    emit(LoginGuestInit());

  }

}
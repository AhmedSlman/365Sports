import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/user_model.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/signup/states.dart';
import 'package:sportat/widgets/snack_bar.dart';

import '../navBar/view.dart';

class SignUpController extends Cubit<SignupStates> {
  SignUpController() : super(SignUpInit());

  static SignUpController of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  String? phone;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController relativePhone = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  CountryCode? item;
  CountryCode? relativeItem;

  DateTime? selectedDate;

  bool isCheck = false;

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(SignUpLoading());
    final body = {
      'code': item,
      'phone': phone,
      'email': email.text,
      'password': password.text,
      'relative_phone': '$relativeItem${relativePhone.text}',
      'd_o_b': dateOfBirth.text,
      'is_check': isCheck ? '1' : '0'
    };
    try {
      final response = await DioHelper.post('register', false, body: body);
      if (kDebugMode) {
        print(response.data);
      }
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1 && isCheck == true) {
        UserModel userModel = UserModel.fromJson(data);
        await AppStorage.cacheRegisterOneInfo(userModel);
        showSnackBar(data['massage']);
        MagicRouter.navigateTo(NavBarView());
        // MagicRouter.navigateTo(PinCodeView(
        //   email: null,
        //   phone: phone,
        //   item: '$item',
        //   isForget: false,
        //   isGuest: false,
        // ));
      } else {
        showSnackBar(data['massage']);
        isCheck == false
            ? showSnackBar('يجب عليك الموافقة علي الشروط والاحكام اولا')
            : null;
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
    emit(SignUpInit());
  }

  selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: MagicRouter.currentContext,
      builder: (context) {
        DateTime? tempPickedDate;
        return SizedBox(
          height: 250,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop(tempPickedDate);
                    },
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2004, 1, 20),
                  onDateTimeChanged: (DateTime dateTime) {
                    tempPickedDate = dateTime;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      final String formatter = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateOfBirth.text = formatter;
      emit(SignUpInit());
    }
  }
}

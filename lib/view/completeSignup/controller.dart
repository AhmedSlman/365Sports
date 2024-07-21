import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/country.dart';
import 'package:sportat/core/models/nationality_model.dart';
import 'package:sportat/core/models/user_model.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/completeSignup/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportat/view/navBar/view.dart';
import 'package:sportat/widgets/snack_bar.dart';

class CompleteSignUpController extends Cubit<CompleteSignupStates> {
  CompleteSignUpController(this.phone,this.item) : super(CompleteSignupInit());

  static CompleteSignUpController of(context) => BlocProvider.of(context);
   TextEditingController expirationDate = TextEditingController();
  void updatefirst(String firstname) => firstName = firstname;
  void updatelast(String lastname) => lastName = lastname;
  void updateid(String idnumber) => idNumber = idnumber;
  void updatebio(String bioo) => bio = bioo;
  String? firstName;
  String? lastName;
  String? idNumber;
  String? bio;
  String phone;
  String? item;
  String? gender;
  TextEditingController? nationality=TextEditingController();
  TextEditingController? country=TextEditingController();
  String? residenceCountry;
  String? identification;
  String? selectCountry;
  DateTime? selectedDate ;

  final formKey = GlobalKey<FormState>();
  File? image;

  NationalityModel? nationalityModel;
  CountryModel? countryModel;
  List<String>? nationalities=[];
  List<String>? countries=[];


  Future<void> completeSignUp() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(CompleteSignupLoading());
    final body = {
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'nationalty': nationality!.text,
      'country': country!.text,
      'type_identifier': identification,
      'expiration_date': expirationDate.text,
      'number_identifier': idNumber,
      'bio': bio,
    };
    FormData formData = FormData.fromMap(body);
    if (image != null) {
      formData.files.add(
          MapEntry('profileImage', await MultipartFile.fromFile(image!.path)));
    }
    print(body.toString());
    try {
      final response =
          await DioHelper.post('register-step-two', false, formData: formData);
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 1) {
        UserModel registerOneModel = UserModel.fromJson(data);
        AppStorage.cacheRegisterOneInfo(registerOneModel);
        MagicRouter.navigateTo(NavBarView());
      } else {
        showSnackBar(data['massage']);
      }
    } catch (e, s) {
      showDefaultError();
      print(e);
      print(s);
    }
    emit(CompleteSignupInit());
  }



  Future<void> getNationality()async{
    emit(CompleteSignupLoading());
    try{
      final response=await DioHelper.get('nationality');
      final data=response!.data as Map<String,dynamic>;
      nationalityModel=NationalityModel.fromJson(data);
      for(int i=0; i<nationalityModel!.data.length ;i++){
        nationalities?.add(nationalityModel!.data[i].name!);

        print(nationality);
      }
      print(nationalities);
    }catch(e){
      showDefaultError();
    }
    emit(CompleteSignupInit());
  }

  Future<void> getCountry()async{
    emit(CompleteSignupLoading());
    try{
      final response=await DioHelper.get('countries');
      final data=response!.data as Map<String,dynamic>;
      countryModel=CountryModel.fromJson(data);
      for(int i=0; i<countryModel!.data.length; i++){
        countries?.add(countryModel!.data[i].name!);
      }
    }catch(e){
      showDefaultError();
    }
    emit(CompleteSignupInit());
  }

  Future<void> getData()async{
    emit(CompleteSignupdata());
   await getNationality();
    await getCountry();
    emit(CompleteSignupInit());

  }

  void selectImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    image = File(pickedImage.path);
    emit(CompleteSignupInit());
  }


  selectDateF() async {
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
                  initialDateTime: DateTime(2022, 8, 20),
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
      final String formatter=DateFormat('yyyy-MM-dd').format(pickedDate);
      expirationDate.text = formatter;
      emit(CompleteSignupInit());
    }
  }

}

import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/completeSignup/controller.dart';
import 'package:sportat/view/completeSignup/widgets/country-picker.dart';
import 'package:sportat/widgets/code_field.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class CompleteTextFields extends StatelessWidget {
  const CompleteTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CompleteSignUpController.of(context);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: sizeFromWidth(2.3),
                child: InputFormField(
                  hint: LocaleKeys.CompleteSignUp_first_name.tr(),
                  // controller: controller.firstName,
                  onSave: (v) => controller.firstName,
                  onChanged: controller.updatefirst,
                  validator: (v) => Validator.name(v!),
                ),
              ),
              SizedBox(
                width: sizeFromWidth(2.3),
                child: InputFormField(
                  hint: LocaleKeys.CompleteSignUp_last_name.tr(),
                  // controller: controller.lastName,
                  onSave: (v) => controller.lastName,
                  onChanged: controller.updatelast,
                  validator: (v) => Validator.name(v!),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: CodeField(
                  items:  [LocaleKeys.CompleteSignUp_male.tr(), LocaleKeys.CompleteSignUp_female.tr()],
                  text: LocaleKeys.CompleteSignUp_gender.tr(),
                  onSave: (v) => controller.gender = v,
                  validator: (v) => Validator.generalField(v!),
                ),
              ),
              const SizedBox(width: 6,),
              Expanded(
                flex: 2,
                child: CountryPickerCard(
                  controller: controller.nationality,
                  hint:  LocaleKeys.CompleteSignUp_nationality.tr(),
                  onChange: (v){
                    controller.nationality!.text=v!;
                  },
                  onSelected: (country){
                    controller.nationality!.text=country.name;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          CountryPickerCard(
            controller: controller.country,
            hint:  LocaleKeys.CompleteSignUp_residence.tr(),
            onChange: (v){
              controller.country!.text=v!;
            },
            onSelected: (country){
              controller.country!.text=country.name;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: sizeFromWidth(2.3),
                  child: CodeField(
                    items: const ["identifier", "passport"],
                    text: LocaleKeys.CompleteSignUp_indentification.tr(),
                    onSave: (v) => controller.identification = v,
                    validator: (v) => Validator.name(v!),
                  )),
              SizedBox(
                  width: sizeFromWidth(2.3),
                  child: InputFormField(
                    hint: LocaleKeys.CompleteSignUp_expiration.tr(),
                     controller: controller.expirationDate,
                    // onSave: (v) => controller.expirationDate=v,
                    // onChanged: controller.updatexpira,
                    validator: (v) => Validator.phoneNumber(v!),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: controller.selectDateF,
                    ),
                  )),
            ],
          ),
          InputFormField(
            hint: LocaleKeys.CompleteSignUp_id_number.tr(),
            isNumber: true,
            // controller: controller.idNumber,
            onSave: (v) => controller.idNumber,
            onChanged: controller.updateid,
            validator: (v) => Validator.phoneNumber(v!),
          ),
          InputFormField(
            hint: LocaleKeys.CompleteSignUp_bio.tr(),
            maxLines: 3,
            multiLine: true,
            isNext: false,
            onSave: (v) => controller.bio,
            onChanged: controller.updatebio,
            validator: (v) => Validator.name(v!),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/changePassword/view.dart';
import 'package:sportat/view/settings/components/submit_buttons.dart';
import 'package:sportat/view/settings/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class PersonalInformationTextFields extends StatelessWidget {
  const PersonalInformationTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.of(context);
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomText(
              verticalMargin: 10,
              alignment: getAlignment(context),
              text: LocaleKeys.Settings_personal_information.tr(),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [
                Expanded(
                    child: InputFormField(
                  hint: "sportat",
                  fillColor: lightGrey,
                  controller: controller.firstName,
                  validator: (value) => Validator.name(value!),
                )),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: InputFormField(
                  hint: "sportat",
                  fillColor: lightGrey,
                  controller: controller.lastName,
                  validator: (value) => Validator.name(value!),
                ))
              ],
            ),
            // InputFormField(
            //   controller: controller.country,
            //   hint: controller.country.text,
            //   onChanged: (v){
            //     controller.country.text=v;
            //   },
            //   fillColor: lightGrey,
            //   suffixIcon: IconButton(icon: const Icon(Icons.arrow_drop_down),onPressed: (){ showCountryPicker(
            //     context: context,
            //     countryListTheme: CountryListThemeData(
            //       flagSize: 25,
            //       backgroundColor: Colors.white,
            //       textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            //       //Optional. Sets the border radius for the bottomsheet.
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(20.0),
            //         topRight: Radius.circular(20.0),
            //       ),
            //       //Optional. Styles the search field.
            //       inputDecoration: InputDecoration(
            //         labelText: 'Search',
            //         hintText: 'Start typing to search',
            //         prefixIcon: const Icon(Icons.search),
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: const Color(0xFF8C98A8).withOpacity(0.2),
            //           ),
            //         ),
            //       ),
            //     ),
            //     onSelect: (Country country) {
            //       controller.country.text=country.name;
            //     },
            //   );},),
            // ),
            //  CodeField(
            //   text: controller.personalInfoModel!.data!.user!.country!,
            //   fillColor: lightGrey,
            //   items: controller.countries,
            // ),
            InputFormField(
              hint: "example@sportat.com",
              fillColor: lightGrey,
              controller: controller.email,
              validator: (value) => Validator.email(value!),
            ),
            InputFormField(
              hint: "+201552698555",
              fillColor: lightGrey,
              controller: controller.phone,
              validator: (value) => Validator.phoneNumber(value!),
            ),
            InputFormField(
              hint: "06/06-2006",
              fillColor: lightGrey,
              validator: (value) => Validator.phoneNumber(value!),
              controller: controller.dateOfBirth,
            ),
            CustomTextButton(
              fontSize: 13,
              text: LocaleKeys.Settings_change_password.tr(),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              alignment: Alignment.centerRight,
              color: Colors.black,
              onPressed: () {
                showModalBottomSheet(
                    context: MagicRouter.currentContext,
                    isScrollControlled: true,
                    builder: (context) => const ChangePasswordView());
              },
            ),
            const SubmitButtons(),
          ],
        ),
      ),
    );
  }
}

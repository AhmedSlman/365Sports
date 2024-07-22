import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/models/personal_info.dart';
import 'package:sportat/view/settings/components/edit_bio_form.dart';
import 'package:sportat/view/settings/components/profile_image.dart';
import 'package:sportat/view/settings/controller.dart';
import 'package:sportat/view/settings/states.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:sportat/widgets/profile_user_information.dart';
import 'components/personal_information_text_fields.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, this.personalInfoModel}) : super(key: key);
  final PersonalInfoModel? personalInfoModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsController(personalInfoModel),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: lightGrey,
          body: BlocBuilder<SettingsController, SettingsStates>(
            builder: (context, state) => state is SettingsLoading
                ? const LoadingIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const ProfileImage(),
                        UserInformation(
                            isPageSettings: true,
                            name:
                                '${SettingsController.of(context).personalInfoModel!.data!.user!.firstName!} ${SettingsController.of(context).personalInfoModel!.data!.user!.lastName!}',
                            description: SettingsController.of(context)
                                .personalInfoModel
                                ?.data!
                                .user!
                                .bio,
                            onTap: () {
                              showEditBioForm(context);
                            }),
                        const PersonalInformationTextFields(),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

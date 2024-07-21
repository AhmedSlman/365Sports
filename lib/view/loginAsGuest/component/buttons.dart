import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/home/view.dart';
import 'package:sportat/view/loginAsGuest/states.dart';
import 'package:sportat/view/signup/widget/terms.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import '../controller.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginAsGuestController.of(context);

    return Column(
      children: [
        BlocBuilder(
          bloc: controller,
          builder: (BuildContext context, state) => state is LoginGuestLoading
              ? const LoadingIndicator()
              : CustomButton(
                  text: LocaleKeys.LogIn_log_in.tr(),
                  fontColor: Colors.white,
                  onPress: controller.login),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: LocaleKeys.byclick.tr(),
              color: Colors.black,
              alignment: getAlignment(context),
              fontSize: 10,
            ),
            CustomTextButton(
              text: LocaleKeys.SignUp_terms_and_privacy.tr(),
              fontSize: 10,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const FractionallySizedBox(
                    heightFactor: 2,
                    child: Terms(),
                  ),
                );
              },
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        CustomTextButton(
          text: LocaleKeys.loginnow.tr(),
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          onPressed: () => MagicRouter.navigateTo(const HomeView()),
        )
      ],
    );
  }
}

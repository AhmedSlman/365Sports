import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/completeSignup/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class CompleteAppBar extends StatelessWidget {
  const CompleteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CompleteSignUpController.of(context);
    return Column(
      children: [
        Image.asset('assets/images/logo1.png'),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: controller.selectImage,
          child: BlocBuilder(
            bloc: controller,
            builder: (context, state) => CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color.fromRGBO(248, 239, 194, 1),
                    backgroundImage: controller.image != null
                        ? FileImage(controller.image!)
                        : null,
                    child: controller.image != null
                        ? null
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                CustomText(
                                  text:
                                      LocaleKeys.CompleteSignUp_add_photo.tr(),
                                  fontSize: 12,
                                  color: Colors.grey,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                  ),
          ),
        ),
      ],
    );
  }
}

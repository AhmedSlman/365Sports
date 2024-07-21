import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/view/completeSignup/component/app_bar.dart';
import 'package:sportat/view/completeSignup/component/buttons.dart';
import 'package:sportat/view/completeSignup/component/text_fields.dart';
import 'package:sportat/view/completeSignup/controller.dart';
import 'package:sportat/view/completeSignup/states.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class CompleteSignupView extends StatelessWidget {
 const CompleteSignupView({
    Key? key,
    this.phone,
   this.item
  }) : super(key: key);
 final String? phone;
 final String? item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteSignUpController(phone!,item)..getData(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primaryColor,
                secColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  const CompleteAppBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<CompleteSignUpController, CompleteSignupStates>(
                      builder: (context, state) =>
                          state is CompleteSignupdata
                              ? const LoadingIndicator()
                              : const CompleteTextFields()),
                  const SizedBox(
                    height: 10,
                  ),
                  const CompleteButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

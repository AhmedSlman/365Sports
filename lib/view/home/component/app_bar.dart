import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/home/controller.dart';
import 'package:sportat/view/rules/view.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/select_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/hlogo.png',
                    width: 50,
                  ),
                  const CustomText(
                    text: '365sportat',
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              AppStorage.isLogged
                  ? InkWell(
                      child: Image.asset(
                        'assets/images/rules.png',
                        width: 50,
                      ),
                      onTap: () => MagicRouter.navigateTo(
                          RulesView(rules: controller.competitionRules)),
                    )
                  : IconButton(
                      onPressed: () => AppStorage.signOut(),
                      icon: const Icon(Icons.logout),
                    ),
            ],
          ),
          AppStorage.isLogged
              ? CustomText(
                  text: '${LocaleKeys.Home_Rules.tr()}   ',
                  fontSize: 14,
                  alignment:
                      isEn(context) ? Alignment.topRight : Alignment.topLeft,
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          AppStorage.isLogged || AppStorage.isGuestLogged
              ? CustomText(
                  text:
                      '   ${LocaleKeys.Home_welcome.tr()} ${AppStorage.isGuestLogged ? "" : AppStorage.getRegisterOneData!.firstName}',
                  // text:controller.homeModel!.data!.isEmpty?'': '   ${LocaleKeys.Home_welcome.tr()} ${controller.homeModel!.data![0].name}',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  alignment: getAlignment(context),
                )
              : const SizedBox(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: sizeFromHeight(25),
            child: ListView.builder(
              itemCount: categories!.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: SelectItemWidget(
                  onTap: () {
                    final selectedCategory = categories![index]["name"];
                    controller.setCategory(selectedCategory);
                  },
                  text: isEn(context)
                      ? categories![index]["name"] ?? ""
                      : categories![index]["name"] ?? "",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

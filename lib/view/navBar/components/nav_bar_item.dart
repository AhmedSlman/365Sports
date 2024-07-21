import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/view/navBar/cubit.dart';
import 'package:sportat/view/navBar/states.dart';
import 'package:sportat/view/navBar/widgets/custom_icon_button.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = NavBarCubit.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.home,
            color: controller.isCurrentIndex(0) ? primaryColor : const Color.fromRGBO(183, 201, 213, 1),
            onPressed: () => controller.changeIndex(0),
          ),
          CustomIconButton(
            icon: Icons.search_rounded,
            color: controller.isCurrentIndex(1) ? primaryColor : const Color.fromRGBO(183, 201, 213, 1),
            onPressed: () => controller.changeIndex(1),
          ),
          CustomIconButton(
            icon: Icons.notifications,
            color: controller.isCurrentIndex(2) ? primaryColor : const Color.fromRGBO(183, 201, 213, 1),
            onPressed: () => controller.changeIndex(2),
          ),
          AppStorage.isGuestLogged
              ? CustomIconButton(
                  icon: Icons.logout,
                  color:
                      controller.isCurrentIndex(2) ? primaryColor : const Color.fromRGBO(183, 201, 213, 1),
                  onPressed: () async => await AppStorage.signOut(),
                )
              : InkWell(
                  onTap: () => controller.changeIndex(3),
                  child: BlocBuilder(
                    bloc: controller,
                    builder: (context, state) => state is NavBarLoading
                        ? const SizedBox()
                        :  CircleAvatar(
                            backgroundImage: NetworkImage(AppStorage.getUserImage ==null?
                                'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg':getBaseUrl+AppStorage.getUserImage!)),
                  ),
                ),
        ],
      ),
    );
  }
}

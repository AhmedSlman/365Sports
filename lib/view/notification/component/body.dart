import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/notification/controller.dart';
import 'package:sportat/view/notification/states.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController.of(context);
    final info = controller.notifications;
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => state is NotificationLoading
          ? const LoadingIndicator()
          : info.isEmpty
              ?  CustomText(
                  text: LocaleKeys.noNotifications.tr(),
                  fontSize: 18,
                  alignment: Alignment.center,
                )
              : ListView.builder(
                  itemCount: info.length,
                  itemBuilder: (context, index) => Container(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CustomText(
                          text: '${info[index].time} ${info[index].date}',
                          alignment: Alignment.topRight,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: info[index].profileImage == null
                                ? const NetworkImage(
                                    'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg')
                                : NetworkImage(
                                    getBaseUrl + info[index].profileImage!),
                          ),
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: info[index].body!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

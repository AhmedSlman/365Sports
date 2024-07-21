import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/view/notification/component/body.dart';
import 'package:sportat/view/notification/controller.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>NotificationController()..getNotification(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: const NotificationBody(),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/notification_model.dart';
import 'package:sportat/view/notification/states.dart';

class NotificationController extends Cubit<NotificationStates> {
  NotificationController() : super(NotificationInit());

  static NotificationController of(context) => BlocProvider.of(context);

  NotificationModel? notificationModel;
  List<Notifications> notifications = [];

  Future<void> getNotification() async {
    emit(NotificationLoading());
    try {
      final response = await DioHelper.get('notifications');
      notificationModel = NotificationModel.fromJson(response?.data);
      notifications.addAll(notificationModel!.data);
    } catch (e) {
      showDefaultError();
    }
    emit(NotificationInit());
  }
}

class FirebaseMessageingService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final token = AppStorage.getToken;
    print("token: $token");
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("title: ${message.notification?.title}");
    print("body: ${message.notification?.body}");
    print("payload: ${message.data}");
  }
}

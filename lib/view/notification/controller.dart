import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/notification_model.dart';
import 'package:sportat/view/notification/states.dart';

class NotificationController extends Cubit<NotificationStates> {
  NotificationController() : super(NotificationInit());

  static NotificationController of(context) => BlocProvider.of(context);

  NotificationModel? notificationModel;
  List<Notifications> notifications=[];

  Future<void> getNotification() async {
    emit(NotificationLoading());
    try {
      final response=await DioHelper.get('notifications');
      notificationModel=NotificationModel.fromJson(response?.data);
      notifications.addAll(notificationModel!.data);
    } catch (e) {
      showDefaultError();
    }
    emit(NotificationInit());

  }
}

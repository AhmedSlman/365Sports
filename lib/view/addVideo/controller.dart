// ignore_for_file: unused_catch_stack

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_ffmpeg/media_information.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/addVideo/states.dart';
import 'dart:io';
import 'package:sportat/widgets/snack_bar.dart';

class AddVideoController extends Cubit<AddVideoStates> {
  AddVideoController() : super(AddVideoInit());

  static AddVideoController of(context) => BlocProvider.of(context);

  TextEditingController title = TextEditingController();
  String? description;
  TextEditingController tags = TextEditingController();
  int? id;
  File? file;
  String? text;
  int? progress;
  double? total;
  String? error = '';
  final formKey = GlobalKey<FormState>();

  Future<void> addVideo() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    if (file == null) {
      MagicRouter.pop();
      showSnackBar('لم يتم تحميل الفيديو');
    }
    emit(AddVideoLoading());
    final body = {
      'title': title.text,
      'category_id': id,
      'description': description,
      'tags': tags.text
    };
    FormData formData = FormData.fromMap(body);
    if (file != null) {
      formData.files.add(
          MapEntry('attachment', await MultipartFile.fromFile(file!.path)));
    }
    if (kDebugMode) {
      print(file!.path.toString());
    }
    try {
      final response = await DioHelper.post('add-video', true,
          formData: formData, onSendProgress: (p, t) {
        progress = p;
        total = p / t;
      });
      final data = response.data as Map<String, dynamic>;
      MagicRouter.pop();
      showSnackBar(data['massage']);
    } catch (e, s) {
      showDefaultError();
    }
    emit(AddVideoInit());
  }

  void getVideo(bool record) async {
    error = '';
    emit(PickingVideo());
    final pickedFile = await ImagePicker().pickVideo(
        source: record ? ImageSource.camera : ImageSource.gallery,
        maxDuration: const Duration(seconds: 60));
    if (pickedFile == null) return;
    file = File(pickedFile.path);
    // final Trimmer trimmer=Trimmer();
    // await trimmer.loadVideo(videoFile: file!);
    // TrimEditor(
    //   trimmer: trimmer,
    //   maxVideoLength: const Duration(seconds: 60),
    // );
    final FlutterFFprobe flutterFFprobe = FlutterFFprobe();
    MediaInformation mediaInformation =
        await flutterFFprobe.getMediaInformation(pickedFile.path);
    if (kDebugMode) {
      print(mediaInformation.getAllProperties()['streams'][0]['duration']);
    }
    String duration =
        mediaInformation.getAllProperties()['streams'][0]['duration'];
    if (double.parse(duration) > 60) {
      file = null;
      error = 'Video Duration Must Be less than 1 Minute';
      if (kDebugMode) {
        print(error);
      }
    }
    emit(CameraLoading());
    emit(AddVideoInit());
  }
}

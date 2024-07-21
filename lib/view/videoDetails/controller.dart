// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/const/default_error.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/video_page_model.dart';
import 'package:sportat/view/videoDetails/states.dart';
import 'package:sportat/view/videoDetails/widget/share_button.dart';
import 'package:sportat/widgets/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoDetailsController extends Cubit<VideoDetailsStates> {
  VideoDetailsController() : super(VideoDetailsInit());
  VideoPageModel? videoPage;
  List<Comment>? comments = [];
  int? isVoted;
  static VideoDetailsController of(context) => BlocProvider.of(context);

  TextEditingController comment = TextEditingController();
  Future<void> getVideoDetails(int? id) async {
    emit(VideoDetailsLoading());
    try {
      final response = await DioHelper.get('video-by-id?id=$id');
      final data = response!.data as Map<String, dynamic>;
      isVoted = AppStorage.isGuestLogged
          ? data['data']['is_vote_guest']
          : data['data']['is_vote_client'];
      videoPage = VideoPageModel.fromJson(data);
      comments!.clear();
      comments!.addAll(videoPage!.data!.comments!);
    } catch (e, s) {
      print(e);
      print(s);
      showDefaultError();
    }
    emit(VideoDetailsInit());
  }

  Future<void> addComment(int? id) async {
    emit(AddingComment());
    final body = {'content': comment.text, 'video_id': '$id'};
    try {
      if (comment.text != '') {
        await DioHelper.post(
            '${AppStorage.isGuestLogged ? 'guest/' : ''}add-comment', true,
            body: body);
      }
      comment.clear();
    } catch (e, s) {
      print(e);
      print(s);
      showDefaultError();
    }
    getVideoDetails(id);
    emit(VideoDetailsInit());
  }

  Future<void> addOrRemoveVote(int? id) async {
    emit(AddingVote());

    final Map<String, dynamic> data;
    final body = {'id': '$id'};
    try {
      final response = await DioHelper.post(
          isVoted == 1?'${AppStorage.isGuestLogged ? 'guest/' : ''}remove-vote': '${AppStorage.isGuestLogged ? 'guest/' : ''}add-vote', true,
              body: body);

      data = response.data as Map<String, dynamic>;

      showSnackBar(data['massage']);
    } catch (e, s) {
      print(e);

      print(s);
      showDefaultError();
    }
     getVideoDetails(id);

    emit(VideoDetailsInit());
  }

  Future<void> addView(int? id) async {
    final body = {'video_id': '$id'};
    try {
      await DioHelper.post(
          '${AppStorage.isGuestLogged ? 'guest/' : ''}add-view', true,
          body: body);
    } catch (e, s) {
      print(e);
      print(s);
      showDefaultError();
    }
    getVideoDetails(id);

    emit(VideoDetailsInit());
  }
  Future share(SocialMedia platform) async {

    final urls = {
      SocialMedia.facebook : (getBaseUrl+ videoPage!.data!.videos!)
      ,SocialMedia.twitter : ('twitter shareable link')
      ,SocialMedia.linkedln : ('face book linkedln link')
    };
    final url = urls[platform]!;
    await launch(url);
  }

}

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
    if (id == null) return;

    emit(VideoDetailsLoading());
    try {
      final response = await DioHelper.get('video-by-id?id=$id');
      final data = response!.data as Map<String, dynamic>;
      isVoted = AppStorage.isGuestLogged
          ? data['data']['is_vote_guest']
          : data['data']['is_vote_client'];
      videoPage = VideoPageModel.fromJson(data);
      comments!.clear();
      comments!.addAll(videoPage!.data!.comments ?? []);
      print(comments);
    } catch (e, s) {
      print(e);
      print(s);
      // showDefaultError();
    }
    emit(VideoDetailsInit());
  }

  Future<void> addComment(int? id) async {
    if (id == null || comment.text.isEmpty) {
      return;
    }

    emit(AddingComment());
    final body = {'content': comment.text, 'video_id': '$id'};
    try {
      final response = await DioHelper.post(
        '${AppStorage.isGuestLogged ? 'guest/' : ''}add-comment',
        true,
        body: body,
      );
      print('Comment Added: ${response.data}');
      comment.clear();
      await getVideoDetails(id);
    } catch (e, s) {
      print(e);
      print(s);
      showDefaultError();
    }
    emit(VideoDetailsInit());
  }

  Future<void> addOrRemoveVote(int? id) async {
    if (id == null) return;

    emit(AddingVote());
    final body = {'id': '$id'};
    final endpoint = isVoted == 1
        ? '${AppStorage.isGuestLogged ? 'guest/' : ''}remove-vote'
        : '${AppStorage.isGuestLogged ? 'guest/' : ''}add-vote';

    try {
      final response = await DioHelper.post(endpoint, true, body: body);
      final data = response.data as Map<String, dynamic>;
      showSnackBar(data['message']);
      await getVideoDetails(id);
    } catch (e, s) {
      print(e);
      print(s);
      showDefaultError();
    }
    emit(VideoDetailsInit());
  }

  Future<void> addView(int? id) async {
    if (id == null) return;

    final body = {'video_id': '$id'};

    try {
      await DioHelper.post(
        '${AppStorage.isGuestLogged ? 'guest/' : ''}add-view',
        true,
        body: body,
      );
      await getVideoDetails(id); // Refresh video details to include new view
    } catch (e, s) {
      print(e);
      print(s);
      showDefaultError();
    }
    emit(VideoDetailsInit());
  }

  Future<void> share(SocialMedia platform) async {
    final urls = {
      SocialMedia.facebook: getBaseUrl + (videoPage?.data?.videos ?? ''),
      SocialMedia.twitter: 'twitter shareable link',
      SocialMedia.linkedln: 'linkedin shareable link',
    };

    final url = urls[platform];
    // ignore: deprecated_member_use
    if (url != null && await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}

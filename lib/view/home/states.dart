import 'package:sportat/core/models/home_model.dart';

abstract class HomeStates {}

class HomeInit extends HomeStates {}

class HomeLoading extends HomeStates {}

class VideosLoaded extends HomeStates {
  late final List<Datu> videos;

  VideosLoaded(this.videos);
}

class VideosLoading extends HomeStates {
  late final List<Datu> oldVideos;
  late final bool isFirstFetch;

  VideosLoading(this.oldVideos, {this.isFirstFetch = false});
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/view/home/controller.dart';
import 'package:sportat/view/home/states.dart';
import 'package:sportat/view/videoDetails/controller.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:sportat/widgets/video_card.dart';


class HomeVideoCard extends StatelessWidget {
   HomeVideoCard({Key? key}) : super(key: key);

  final scrollController=ScrollController();
  final controller=HomeController();

  void setupScrollController(context){
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
          //controller.loadVideos();
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final controller = HomeController.of(context);
    var videos = HomeController.of(context).homeVideos;
    return  BlocBuilder(
      bloc: controller,
      builder: (context,state){
        if(state is VideosLoading &&state.isFirstFetch){
          return const LoadingIndicator();
        }
        bool isLoading=false;
        if(state is VideosLoading){
          videos=state.oldVideos;
          isLoading=true;
        }else if (state is VideosLoaded){
          videos=state.videos;
        }
        return ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: videos.length +(isLoading ? 1 :0),
            itemBuilder: (context, index) {
              if(index < videos.length) {
                return videos[index].videos == null
                    ? const Text("")
                    : VideoCard(
                  onTap: () =>
                      VideoDetailsController().addView(videos[index].id),
                  id: videos[index].id,
                  image: getBaseUrl + videos[index].videos!,
                  usrImage: videos[index].clientImage == null
                      ? "https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg"
                      : getBaseUrl + videos[index].clientImage!,
                  name: videos[index].name,
                  date: videos[index].createdAt,
                  viewsNumber: videos[index].views.toString() + " Views",
                  videoTitle: videos[index].title,
                  isLive: controller.checkModel!.live==0?false:true,
                  // videoDuration: "02:00 Mins",
                );
              }else{
                Timer(const Duration(milliseconds: 30),(){
                  scrollController.jumpTo(scrollController.position.maxScrollExtent);
                });
                return const LoadingIndicator();
              }
            }
          );
      },
    );
  }
}

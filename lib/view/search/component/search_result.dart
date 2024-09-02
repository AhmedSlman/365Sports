import 'package:flutter/material.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/profile/view.dart';
import 'package:sportat/view/search/widget/search_card.dart';
import '../controller.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchModel = SearchControllerCubit.get(context).searchModel?.data;
    return searchModel == null || searchModel.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchModel.length,
                itemBuilder: (context, index) => SearchCard(
                  onTap: () => MagicRouter.navigateTo(
                    ProfileView(
                      isSearch: true,
                      id: searchModel[index].id,
                    ),
                  ),
<<<<<<< HEAD
                  // image: searchModel[index].clientImage == null
                  //     ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
                  //     : getBaseUrl + searchModel[index].!,
                  name: searchModel[index].firstName!,
=======
                  image: searchModel[index].clientImage == null
                      ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
                      : getBaseUrl + searchModel[index].clientImage!,
                  name: searchModel[index].name!,
                  
>>>>>>> 3521e579d24ae5113028d4109837ce0ebe20893f
                ),
              ),

              sea // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: searchModel.length,
              //   itemBuilder: (context, index) =>  VideoCard(
              //     id:searchModel[index].id,
              //     image: getBaseUrl+searchModel[index],
              //     usrImage:searchModel[index].clientImage==null?'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg': getBaseUrl+searchModel[index].clientImage!,
              //     name: searchModel[index].name,
              //     date: searchModel[index].createdAt,
              //     viewsNumber: searchModel[index].views.toString(),
              //     videoTitle:searchModel[index].title,
              //     //videoDuration: "02:00 Mins",
              //   ),
              // )
            ],
          );
  }
}

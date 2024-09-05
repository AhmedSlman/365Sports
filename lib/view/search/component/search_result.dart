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
                itemBuilder: (context, index) {
                  final profilePictureUrl = searchModel[index].profilePicture == null
                      ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
                      : getBaseUrl + searchModel[index].profilePicture!;

                  // طباعة رابط الصورة في وحدة التحكم
                  print(
                      "###############Profile Picture URL: $profilePictureUrl###############");


                  return SearchCard(
                    onTap: () {
                      print(
                          "***********************${searchModel[index].id}s*******************");
                      MagicRouter.navigateTo(
                        ProfileView(
                          isSearch: true,
                          id: searchModel[index].id,
                        ),
                      );
                    },
                    image: profilePictureUrl,
                    name:
                        "${searchModel[index].firstName} ${searchModel[index].lastName}",
                  );
                },
              ),
            ],
          );
  }
}

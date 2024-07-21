import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/view/profile/components/app_bar_image.dart';
import 'package:sportat/view/profile/controller.dart';
import 'package:sportat/view/profile/states.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'components/talent_videos.dart';
import '../../widgets/profile_user_information.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, this.id, this.isSearch, }) : super(key: key);
  final int? id;
  final bool? isSearch;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileController(id: id,isSearch: isSearch!)..getData(),
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: BlocBuilder<ProfileController, ProfileStates>(
          builder: (context, state) => state is ProfileLoading
              ? const LoadingIndicator()
              : RefreshIndicator(
                  onRefresh: ProfileController.of(context).getData,
                  child: ListView(
                    children: [
                      const AppBarImage(),
                      UserInformation(
                        isPageSettings: false,
                        name: ProfileController.of(context)
                            .profileModel
                            ?.data
                            ?.name,
                        description: ProfileController.of(context)
                            .profileModel
                            ?.data
                            ?.bio,
                        views: ProfileController.of(context)
                            .profileModel
                            ?.data
                            ?.views,
                        votes: ProfileController.of(context)
                            .profileModel
                            ?.data
                            ?.votes,
                      ),
                      TalentVideos()
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

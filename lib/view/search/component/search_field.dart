import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/navBar/view.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

import '../controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SearchControllerCubit.get(context);

    return Container(
      margin: const EdgeInsets.only(
        top: 42,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          BlocBuilder(
            bloc: controller,
            builder: (context, state) => Row(
              children: [
                 Expanded(
                  child: BackButton(
                    onPressed: ()=>MagicRouter.navigateTo(const NavBarView()),
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 9,
                  child: InputFormField(
                    hint: LocaleKeys.Search_search.tr(),
                    radius: 9,
                    fillColor: Colors.white,
                    icon: Icons.search_rounded,
                    onChanged: controller.getSearchResults,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // SizedBox(
          //   height: sizeFromHeight(25),
          //   child: ListView.builder(
          //     itemCount: 3,
          //     padding: EdgeInsets.zero,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) => Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 6),
          //       child: SelectItemWidget(
          //         onTap: () {},
          //         text: 'All',
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

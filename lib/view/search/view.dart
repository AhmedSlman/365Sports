import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/view/search/component/search_field.dart';
import 'package:sportat/view/search/component/search_result.dart';
import 'package:sportat/view/search/controller.dart';
import 'package:sportat/view/search/states.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchControllerCubit>(
      create: (context) => SearchControllerCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
          body: SingleChildScrollView(
            child: Column(
              children:  [
                const SearchField(),
                const SizedBox(
                  height: 9,
                ),
                BlocBuilder<SearchControllerCubit, SearchStates>(
                    builder: (context, state) => state is SearchLoading
                        ? const LoadingIndicator()
                        : const SearchResult())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

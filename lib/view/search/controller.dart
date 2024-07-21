

// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/core/dioHelper/dio_helper.dart';
import 'package:sportat/core/models/serach_model.dart';
import 'package:sportat/view/search/states.dart';

class SearchControllerCubit extends Cubit<SearchStates>{
  SearchControllerCubit() : super(SearchInit());


  static SearchControllerCubit get(context)=>BlocProvider.of(context);

  SearchModel? searchModel;

  Future<void> getSearchResults(String text) async {
    emit(SearchLoading());
    final response = await DioHelper.get('search?search=$text');
    final data = response!.data as Map<String, dynamic>;
    if (data.containsKey('data')) {
      searchModel = SearchModel.fromJson(response.data);
      print(data);
    }
    emit(SearchInit());
  }
}
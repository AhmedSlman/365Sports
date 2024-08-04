import 'package:sportat/core/models/home_model.dart';

abstract class NavBarStates {}

class NavBarInit extends NavBarStates {}

class NavBarLoading extends NavBarStates {}

class NavBarIndexChanged extends NavBarStates {
  final int currentIndex;

  NavBarIndexChanged(this.currentIndex);
}

class NavBarHomeDataLoaded extends NavBarStates {
  final HomeModel? homeModel;

  NavBarHomeDataLoaded(this.homeModel);
}

class NavBarError extends NavBarStates {
  final String message;

  NavBarError(this.message);
}

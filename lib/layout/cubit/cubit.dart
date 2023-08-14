import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/layout/cubit/states.dart';
import 'package:to_do_list/modules/business/business_screen.dart';
import 'package:to_do_list/modules/science/science_screen.dart';
import 'package:to_do_list/modules/settings/settings_screen.dart';
import 'package:to_do_list/modules/sports/sports_screen.dart';
import 'package:to_do_list/shared/network/local/cash_helper.dart';

import '../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  //UI Variables
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: "Business",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: "Sports",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: "Science",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Settings",
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  List<dynamic> businessNews = [];
  List<dynamic> sportsNews = [];
  List<dynamic> scienceNews = [];
  bool appThemeModeDark = false;

  //Change Navigation Bar Index
  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    if (index == 1)
      getSportsData();
    if (index == 2)
      getScienceData();
    emit(NewsBottomNavState());
  }

  //Get Business Data
  void getBusinessData() {
    if (businessNews.length == 0) {
      print("Did Enter Get Business Data?????????????????????");
      emit(NewsLoadingState());
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"business",
          "apiKey":"b098d264536b4be1929142f5b86328c1",
        },
      ).then((value) {
        businessNews = value.data["articles"];
        print("Business News is !!!!!!!!!!: ${businessNews}");
        emit(NewsGetBusinessSuccesState());
      }).catchError((error)
      {
        print("an error has occured: ${error.toString()}");
        emit(NewsGetBusinessErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccesState());
    }

}

  //Get Sports Data
  void getSportsData() {
    if (sportsNews.length == 0) {
      emit(NewsSportsLoadingState());
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"us",
          "category":"sports",
          "apiKey":"b098d264536b4be1929142f5b86328c1",
        },
      ).then((value) {
        sportsNews = value.data["articles"];

        emit(NewsGetSportsSuccesState());
      }).catchError((error)
      {
        print("an error has occured: ${error.toString()}");
        emit(NewsGetSportsErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccesState());
    }

}

  //Get Science Data
  void getScienceData() {
    if (scienceNews.length == 0) {
      emit(NewsScienceLoadingState());
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"us",
          "category":"science",
          "apiKey":"b098d264536b4be1929142f5b86328c1",
        },
      ).then((value) {
        scienceNews = value.data["articles"];
        emit(NewsGetScienceSuccesState());
      }).catchError((error)
      {
        print("an error has occured: ${error.toString()}");
        emit(NewsGetScienceErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccesState());
    }

}

  //Change Theme Mode
  void changeThemeMode() {
    appThemeModeDark = !appThemeModeDark;
    CashHelper.setData(key: "isDark", value: appThemeModeDark).then((value) {
      emit(AppChangeThemeModeState());
    }).catchError((error) {
      print("Error Setting Theme mode data!!!!!!!!!!!!!!!! ${error.toString()}");
    });
  }
  
}
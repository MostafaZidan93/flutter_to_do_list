abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}


//MARK:- Business States
class NewsGetBusinessSuccesState extends NewsStates {}
class NewsGetBusinessErrorState extends NewsStates
{
  final String error;
  NewsGetBusinessErrorState({required this.error});
}
class NewsLoadingState extends NewsStates {}

//MARK:- Sports States
class NewsGetSportsSuccesState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates
{
  final String error;
  NewsGetSportsErrorState({required this.error});
}

class NewsSportsLoadingState extends NewsStates {}


//MARK:- Science
class NewsGetScienceSuccesState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates
{
  final String error;
  NewsGetScienceErrorState({required this.error});
}

class NewsScienceLoadingState extends NewsStates {}

//MARK: -Dark Theme State
class AppChangeThemeModeState extends NewsStates {}
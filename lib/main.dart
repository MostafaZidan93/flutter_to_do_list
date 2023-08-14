import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/layout/cubit/cubit.dart';
import 'package:to_do_list/layout/cubit/states.dart';
import 'package:to_do_list/shared/network/local/cash_helper.dart';
import 'package:to_do_list/shared/network/remote/dio_helper.dart';
import 'layout/news_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CashHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusinessData(),
        child: BlocConsumer<NewsCubit, NewsStates> (
          listener: (context, state) {},
          builder: (context, state) {
            print("Did entered from main_______________________");
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.purple,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.purple,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepPurple,
                scaffoldBackgroundColor: Colors.grey,
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white10,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.white70,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.deepPurple,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepPurple,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )
                ),
              ),
              themeMode: NewsCubit.get(context).appThemeModeDark ? ThemeMode.dark : ThemeMode.light,
              home: Directionality(
                child: NewsLayout(),
                textDirection: TextDirection.ltr ,
              ),
            );
          }
        ),
    );
  }
}

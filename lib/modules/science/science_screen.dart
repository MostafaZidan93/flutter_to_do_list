import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/layout/cubit/cubit.dart';
import 'package:to_do_list/layout/cubit/states.dart';
import 'package:to_do_list/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var scienceList = NewsCubit.get(context).scienceNews;
          return articlesListBuilder(scienceList);
        },
        listener: (context, state) {}
    );
  }
}

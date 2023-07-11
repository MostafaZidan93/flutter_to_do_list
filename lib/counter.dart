import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/cubit.dart';
import 'package:to_do_list/cubit/states.dart';

class MyCounter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {
            if(state is CounterPlusState) print("CounterPlusStateis: ${state.counter}");
            if(state is CounterMinusState) print("CounterMinusStateis: ${state.counter}");
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: Text("My Counter"),),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        CounterCubit.get(context).minus();
                        print("minus");
                      },
                      child: Icon(Icons.exposure_minus_1),
                    ),
                    SizedBox(width: 50,),
                    Text("${CounterCubit.get(context).counter}"),
                    SizedBox(width: 50,),
                    FloatingActionButton(
                      onPressed: (){
                        CounterCubit.get(context).plus();
                        print("add");
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

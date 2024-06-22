import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/cubit/home_cubit.dart';
import 'package:slash/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..loadHomeData()),
      ],
      
      child: MaterialApp(
        title: 'Slash',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          
        ),
        
        home: HomeScreen(),
      ),
    );
  }
}

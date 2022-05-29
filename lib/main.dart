import 'dart:io';

import 'package:aya_trades_internship_tasks/shared/bloc_observer.dart';
import 'package:aya_trades_internship_tasks/shared/cubit/cubit.dart';
import 'package:aya_trades_internship_tasks/shared/network/local/cache_helper.dart';
import 'package:aya_trades_internship_tasks/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'http_overrides.dart';
import 'modules/live/live_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  DioHelper.init();

  HttpOverrides.global = MyHttpOverrides();

  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LiveScreen(),
      ),
    );
  }
}



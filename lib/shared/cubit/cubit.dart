import 'package:aya_trades_internship_tasks/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LiveChangePasswordVisibilityState());
  }

  bool firstToggleValue = true;

  void changeToggleValue() {
    firstToggleValue = !firstToggleValue;
    emit(AppChangeToggleValueState());
  }
}
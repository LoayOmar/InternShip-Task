import 'package:aya_trades_internship_tasks/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  double elevation = 10,
  Color? background,
  double radius = 12.0,
  double textSize = 16.0,
  required var function,
  required String text,
  Color textColor = Colors.black,
  required BuildContext context,
  LinearGradient? gradient,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 5, left: 5.44),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          color: background,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  var onSubmit,
  var onTap,
  var onChanged,
  var suffixPressed,
  var validate,
  String? label,
  String? hint,
  IconData? prefix,
  bool isClickable = true,
  IconData? suffix,
  Color suffixColor = Colors.blue,
}) =>
    TextFormField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: thirdColor,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 12,
          color: HexColor("#969696"),
        ),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 20),
        prefixIcon: prefix != null
            ? Icon(
                prefix,
              )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: HexColor("#969696"),
                ),
                onPressed: suffixPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onTap: onTap,
      enabled: isClickable,
      validator: validate,
      onChanged: onChanged,
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (ctx) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Widget defaultTextButton({
  required var function,
  required String text,
  double? textSize = 12,
}) =>
    InkWell(
      onTap: function,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: defaultColor,
          fontSize: 12,
        ),
      ),
    );

Widget buildSwitchTab(
  bool isLeft,
  String title,
  TextStyle style,
  int i,
  BuildContext context,
) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      AppCubit.get(context).changeToggleValue();
    },
    child: Container(
      alignment: Alignment.center,
      height: 33,
      width: (MediaQuery.of(context).size.width / 2) - 20,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: style,
      ),
    ),
  );
}

SnackBar showToast({
  required String text,
  required ToastStates state,
}) {
  return SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: chooseToastColor(state),
  );
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }

  return color;
}

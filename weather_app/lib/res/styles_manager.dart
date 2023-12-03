
import 'package:weather_app/res/values_manager.dart';
import './font_manager.dart';
import 'package:flutter/material.dart';
import './color_manager.dart';

InputDecoration inputDecorator(String hint) {
  return InputDecoration(
    errorMaxLines: 2,
    enabled: true,
    hintText: hint,
    hintStyle: getRegularStyle(color: ColorManager.black),
    errorStyle: getRegularStyle(color: ColorManager.error),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(width: 1, color: ColorManager.error),
    ),
    isDense: true,
    contentPadding:
        const EdgeInsets.only(top: 15.0, bottom: 10.0, left: 10.0, right: 6.0),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: ColorManager.grey),
      borderRadius: BorderRadius.circular(8.0),
    ),
    border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
        borderRadius: BorderRadius.circular(8.0)),
    disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
        borderRadius: BorderRadius.circular(8.0)),
    focusColor: const Color(0xFFCCCCCC),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
        borderRadius: BorderRadius.circular(8.0)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
        borderRadius: BorderRadius.circular(8.0)),
  );
}

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: 'Roboto',
      fontSize: fontSize, color: color, fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

// button style
ButtonStyle _getButttonStyle(
  Color color,
) {
  return ElevatedButton.styleFrom(
    primary: color, // background color
    onPrimary: Colors.white, // foreground color
    elevation: 5, // elevation of button
  );
}

ButtonStyle getPrimaryButtonStyle() {
  return _getButttonStyle(ColorManager.primary);
}

//Current weather card decotaion
BoxDecoration getCurrentWeatherContainerDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(AppSize.s40),
      gradient: LinearGradient(
        colors: [ColorManager.primary, ColorManager.secondary],
        begin: Alignment.center,
        end: Alignment.bottomCenter,
      ));
}
